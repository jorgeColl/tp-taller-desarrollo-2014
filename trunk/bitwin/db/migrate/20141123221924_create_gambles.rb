class CreateGambles < ActiveRecord::Migration
  def change
    create_table :gambles do |t|
      t.references :user, index: true
      t.integer :firstChosen
      t.integer :secondChosen
      t.integer :thirdChosen
      t.integer :fourthChosen
      t.integer :fifthChosen
      t.integer :firstRaffled
      t.integer :secondRaffled
      t.integer :thirdRaffled
      t.integer :fourthRaffled
      t.integer :fifthRaffled
      t.integer :cost

      t.timestamps
    end
  end
end
