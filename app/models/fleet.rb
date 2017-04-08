class Fleet < ApplicationRecord
  has_one :city, required: true

  validates :name, presence: true

end
