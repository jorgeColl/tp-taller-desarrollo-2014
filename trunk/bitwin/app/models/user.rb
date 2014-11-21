class User < ActiveRecord::Base
  #basado en ejemplos de https://www.railstutorial.org/
  before_save :fieldsToLower

  validates :nickname,  presence: true, length: { maximum: 25 }, uniqueness: { case_sensitive: false }
  validates :mail, presence: true, length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :walletNmb, presence: true, length: { in: 26..35 }, uniqueness: true
  has_secure_password
  validates :password, length: { minimum: 8 }

  def fieldsToLower
   	self.nickname.downcase!
   	self.mail.downcase!

  end
end
