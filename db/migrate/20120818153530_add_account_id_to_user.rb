class AddAccountIdToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :account_id, :null => false
    end
  end
end
