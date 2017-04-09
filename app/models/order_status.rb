class OrderStatus < ApplicationRecord
  validates :name, presence: true
end
