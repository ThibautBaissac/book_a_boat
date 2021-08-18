class Ship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :daily_price, numericality: { greater_than: 0 }
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
