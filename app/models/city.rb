class City < ApplicationRecord
  has_many :fleets

  validates :name, presence: true

end
