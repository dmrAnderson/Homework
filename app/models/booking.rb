class Booking < ApplicationRecord
  belongs_to :customer

  validates :city_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
end
