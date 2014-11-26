class CreateShoppings < ActiveRecord::Migration
  def change
    create_table :shoppings do |t|
      t.integer :amount
      t.references :user, index: true

      t.timestamps
    end
  end
end
