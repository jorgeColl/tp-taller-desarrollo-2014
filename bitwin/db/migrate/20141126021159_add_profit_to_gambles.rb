class AddProfitToGambles < ActiveRecord::Migration
  def change
    add_column :gambles, :profit, :integer
  end
end
