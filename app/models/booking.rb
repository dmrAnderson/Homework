class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner

  validates :customer_id, presence: true
  validates :cleaner_id,  presence: true
  validates :date,        presence: true
end
