class Package < ApplicationRecord
  attr_accessor :raw_address


  default_scope { order(created_at: :desc) }


  belongs_to :user
  belongs_to :order_status
  belongs_to :bus
  #belongs_to :origin_id, class_name: 'City', foreign_key: 'origin_id'
  #belongs_to :destination_id, class_name: 'City', foreign_key: 'destination_id'

  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude, :address => :full_address


  validates :trackingid, presence: true
  after_validation :geocode , if: ->(obj){ obj.address.present? and obj.address_changed? }

  geocoded_by :raw_address
  after_validation -> {
    self.address = self.raw_address
    geocode
  }, if: ->(obj){ obj.raw_address.present? and obj.raw_address != obj.address }


  after_validation :reverse_geocode, unless: ->(obj) { obj.address.present? },
                   if: ->(obj){ obj.latitude.present? and obj.latitude_changed? and obj.longitude.present? and obj.longitude_changed? }

  def origin
    City.find(self.origin_id)
  end
  def destination
    City.find(self.destination_id)    
  end
  def entry_date
    self.created_at.strftime("%m/%d/%Y") 
  end
end
