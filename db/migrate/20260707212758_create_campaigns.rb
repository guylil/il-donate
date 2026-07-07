class CreateCampaigns < ActiveRecord::Migration[8.1]
  def change
    create_table :campaigns do |t|
      t.string :title, null: false
      t.text :description
      t.string :organization_name, null: false
      t.text :organization_description
      t.integer :goal_amount, null: false
      t.integer :amount_raised, null: false, default: 0
      t.string :slug, null: false
      t.string :status, null: false, default: "active"

      t.timestamps
    end
    add_index :campaigns, :slug, unique: true
  end
end
