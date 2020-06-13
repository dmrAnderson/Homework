class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner, optional: true

  validates :city_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
