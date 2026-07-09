class AddCoverPicNameToCampaigns < ActiveRecord::Migration[8.1]
  def change
    add_column :campaigns, :cover_pic_name, :string
  end
end
