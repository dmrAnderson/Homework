class Cleaner < ApplicationRecord
  has_one :booking
  has_many :workplaces
end
