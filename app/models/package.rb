class Package < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  belongs_to :bus
  #belongs_to :origin_id, class_name: 'City', foreign_key: 'origin_id'
  #belongs_to :destination_id, class_name: 'City', foreign_key: 'destination_id'

  validates :trackingid, presence: true

end
