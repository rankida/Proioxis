class RemovePostcodeFromAccounts < ActiveRecord::Migration
  def change
    change_table :accounts do |t|
      t.remove :postcode
    end
  end
end
