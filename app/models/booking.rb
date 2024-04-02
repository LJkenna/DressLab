class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :rent_end_date, presence: true
  validates :rent_start_date, presence: true
  enum status: [:request_accepted, :request_pending, :request_rejected]
end
