class DonationsController < ApplicationController
  def index
    @campaign = Campaign.find(params[:campaign_id])
    @pending_donations = @campaign.donations.where(status: "pending").order(created_at: :desc)
    @paid_donations = @campaign.donations.where(status: "paid").order(created_at: :desc)
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.build(donation_params)
    @donation.amount = @donation.amount.to_i
    @donation.status = "pending"
    @donation.currency = "ILS"

    if @donation.save
      @donation.campaign.increment!(:amount_raised, @donation.amount)
      render turbo_stream: turbo_stream.replace(
        "donation-form",
        partial: "donations/thank_you",
        locals: { campaign: @campaign }
      )
    else
      render turbo_stream: turbo_stream.replace(
        "donation-form",
        partial: "donations/form",
        locals: { campaign: @campaign, donation: @donation }
      )
    end
  end

  def approve
    @donation = Donation.find(params[:id])
    @donation.update!(status: "paid")
    @donation.campaign.increment!(:amount_raised, @donation.amount)
    render turbo_stream: [
      turbo_stream.remove("donation_#{@donation.id}"),
      turbo_stream.prepend("paid-table-body", partial: "donations/paid_row", locals: { d: @donation })
    ]
  end

  def cancel
    @donation = Donation.find(params[:id])
    @donation.update!(status: "cancel-by-admin")
    render turbo_stream: turbo_stream.remove("donation_#{@donation.id}")
  end

  private

  def donation_params
    params.require(:donation).permit(
      :amount, :recurring, :recurring_months,
      :donor_first_name, :donor_last_name, :donor_email, :donor_phone,
      :display_preference, :dedication
    )
  end
end
