class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.integer :coins
      t.string :walletNmb
   	  t.string :mail
      t.timestamps
    end
  end
end
