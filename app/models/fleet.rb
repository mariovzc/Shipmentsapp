class Fleet < ApplicationRecord
  has_one :city, required: true
  has_many :buses
  
  validates :name, presence: true

end
