class Fleet < ApplicationRecord
  belongs_to :city
  has_many :buses
  
  validates :name, presence: true

end
