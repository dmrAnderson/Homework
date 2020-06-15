class Workplace < ApplicationRecord
  belongs_to :cleaner
  belongs_to :city

  validates :city_id, presence: true
end
