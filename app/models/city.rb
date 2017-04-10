class City < ApplicationRecord
  has_one :fleet

  has_many :origin_id, class_name: 'Package', foreign_key: 'origin_id'
  has_many :destination_id, class_name: 'Package', foreign_key: 'destination_id'


  validates :name, presence: true

end
