class CreateDonations < ActiveRecord::Migration[8.1]
  def change
    create_table :donations do |t|
      t.references :campaign, null: false, foreign_key: true
      t.integer :amount
      t.string :currency
      t.boolean :recurring
      t.integer :recurring_months
      t.string :donor_first_name
      t.string :donor_last_name
      t.string :donor_email
      t.string :donor_phone
      t.integer :display_preference
      t.text :dedication
      t.string :status

      t.timestamps
    end
  end
end
