class Customer < ApplicationRecord
  has_one :booking, dependent: :destroy
  accepts_nested_attributes_for :booking
end
