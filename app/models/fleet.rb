class Fleet < ApplicationRecord
  has_one :city
  has_many :bus
  
  validates :name, presence: true

end
