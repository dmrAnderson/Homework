class City < ApplicationRecord
  validates :name, presence: true,
                   length: { maximum: 25 },
                   uniqueness: true,
                   format: { with: /\A[a-zA-Z]+\z/,
                             message: "Only letters allowed" }
end
