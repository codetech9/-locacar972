class Booking < ApplicationRecord
  has_many :bookings, dependent: :destroy
  validates :starts_at, :ends_at, presence: true
end
