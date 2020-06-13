class Workplace < ApplicationRecord
  belongs_to :cleaner

  validates :city_id, presence: true
end
