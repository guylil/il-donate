class CampaignsController < ApplicationController
  def show
    campaign_param = params[:slug] || params[:id]
    @campaign = Campaign.find_by(slug: campaign_param) || Campaign.find(campaign_param)
    @tab = params[:tab].presence_in(%w[story donors about]) || "story"
    @donations = @campaign.donations.where(status: "paid").order(created_at: :desc).limit(20) if @tab == "donors"
    @donation = @campaign.donations.build
  end
end
