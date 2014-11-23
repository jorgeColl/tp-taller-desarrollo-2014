class Gamble < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :firstChosen, presence: true, :inclusion => 0..99
  validates :secondChosen, presence: true, :inclusion => 0..99
  validates :thirdChosen, presence: true, :inclusion => 0..99
  validates :fourthChosen, presence: true, :inclusion => 0..99
  validates :fifthChosen, presence: true, :inclusion => 0..99
  validates :cost, presence: true,  :numericality => { :greater_than_or_equal_to => 0
end
