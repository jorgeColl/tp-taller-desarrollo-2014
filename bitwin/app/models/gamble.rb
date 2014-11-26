class Gamble < ActiveRecord::Base
  #basado en ejemplos de https://www.railstutorial.org/
  belongs_to :user
  before_save :initializeFields
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :firstChosen, presence: true, :inclusion => 0..99
  validates :secondChosen, presence: true, :inclusion => 0..99
  validates :thirdChosen, presence: true, :inclusion => 0..99
  validates :fourthChosen, presence: true, :inclusion => 0..99
  validates :fifthChosen, presence: true, :inclusion => 0..99
  validates :cost, presence: true,  :numericality => { :greater_than_or_equal_to => 0}
  validate :numbersAreUnique

  def numbersAreUnique
    chosenNumbers = [ self.firstChosen, self.secondChosen, self.thirdChosen, self.fourthChosen, self.fifthChosen]
    errorsFound = false
    for i in 0..4
      for j in i..4
          if i != j and chosenNumbers[i] == chosenNumbers[j]
            errorsFound = true
          end
      end
    end
    if errorsFound 
      errors.add(:firstChosen, "Los numeros ingresados deben ser diferentes") 
    end
  end

  def initializeFields
    self.cost = 15
  end
end
