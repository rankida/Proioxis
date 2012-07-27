class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :company_name
      t.string :billing_details
      t.string :address1
      t.string :address2
      t.string :address2
      t.string :postcode

      t.timestamps
    end
  end
end
