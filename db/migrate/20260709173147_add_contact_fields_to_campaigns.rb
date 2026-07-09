class AddContactFieldsToCampaigns < ActiveRecord::Migration[8.1]
  def change
    add_column :campaigns, :contact_email, :string
    add_column :campaigns, :contact_phone, :string
    add_column :campaigns, :contact_website, :string
  end
end
