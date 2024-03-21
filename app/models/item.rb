class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :brand, presence: true
  validates :size, presence: true
  validates :color, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
