class Gamble < ActiveRecord::Base
  #basado en ejemplos de https://www.railstutorial.org/
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :firstChosen, presence: true, :inclusion => 0..99
  validates :secondChosen, presence: true, :inclusion => 0..99
  validates :thirdChosen, presence: true, :inclusion => 0..99
  validates :fourthChosen, presence: true, :inclusion => 0..99
  validates :fifthChosen, presence: true, :inclusion => 0..99
  validates :cost, presence: true,  :numericality => { :greater_than_or_equal_to => 0}
end
