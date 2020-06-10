class Workplace < ApplicationRecord
  belongs_to :cleaner

  validates :cleaner_id,  presence: true
  validates :city_id,     presence: true
end
