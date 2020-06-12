class Workplace < ApplicationRecord
  belongs_to :cleaner, optional: true

  validates :cleaner_id, presence: true
  validates :city_id, presence: true

end
