class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :brand, :model, :address, presence: true
  validates :price_per_day, presence: true
end
