class Package < ApplicationRecord
  belongs_to :user
  belongs_to :order_status
  belongs_to :bus

  validates :trackingid, presence: true

end
