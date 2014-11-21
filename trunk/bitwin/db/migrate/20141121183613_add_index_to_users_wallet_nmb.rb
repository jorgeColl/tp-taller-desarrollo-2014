class AddIndexToUsersWalletNmb < ActiveRecord::Migration
  def change
   	add_index :users, :walletNmb, unique: true
  end
end
