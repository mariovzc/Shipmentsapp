class Bus < ApplicationRecord
  has_one :fleet

  validates :license_plate, presence: true
  validates :fleet_id, presence: true
end
