class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :packages

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: true, email_format: { message: 'Formato invalido' }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    self.first_name + " " +  self.last_name
  end
end
