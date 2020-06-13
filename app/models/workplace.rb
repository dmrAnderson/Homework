class Workplace < ApplicationRecord
  belongs_to :cleaner, optional: true
end
