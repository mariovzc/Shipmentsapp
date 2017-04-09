class OrderStatus < ApplicationRecord
  validates :name, presence: true
  has_many :packages  
end
