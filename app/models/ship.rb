class Ship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :daily_price, numericality: { greater_than: 0 }
end
