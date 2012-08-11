class RemoveAddress2FromAccounts < ActiveRecord::Migration
	def change
    change_table :accounts do |t|
    	t.remove :address2
    	t.rename :address1, :address
    end
  end
end
