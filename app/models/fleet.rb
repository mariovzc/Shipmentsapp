class Fleet < ApplicationRecord
  has_one :city, required: true
  has_many :bus
  
  validates :name, presence: true

end
