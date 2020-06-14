class City < ApplicationRecord
  validates :name, presence: true,
                   length: { in: 4..14 },
                   uniqueness: true,
                   format: { with: /\A[a-zA-Z ]+\z/,
                             message: "Only letters allowed" }
end
