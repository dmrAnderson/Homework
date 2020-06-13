class City < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 },
                   uniqueness: true, format: { with: VALID, message: MSG }
end
