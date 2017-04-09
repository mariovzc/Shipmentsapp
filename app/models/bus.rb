class Bus < ApplicationRecord
  has_one :fleet
  has_many :packages

  validates :license_plate, presence: true
  validates :fleet_id, presence: true
end
