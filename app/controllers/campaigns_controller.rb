class CampaignsController < ApplicationController
  def show
    campaign_param = params[:slug] || params[:id]
    @campaign = if campaign_param
                  Campaign.find_by(slug: campaign_param) || Campaign.find(campaign_param)
                else
                  Campaign.first
                end
    @tab = params[:tab].presence_in(%w[story donors about]) || "story"
    @donations = @campaign.donations.where(status: [ "pending", "paid" ]).order(created_at: :desc).limit(20) if @tab == "donors"
    @donation = @campaign.donations.build
  end
end
