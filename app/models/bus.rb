class Bus < ApplicationRecord
  belongs_to :fleet
  has_many :packages

  validates :license_plate, presence: true
  validates :fleet_id, presence: true
end
