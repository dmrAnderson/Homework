class Customer < ApplicationRecord
  has_one :booking

  validates :first_name,   presence: true
  validates :last_name,    presence: true
  validates :phone_number, length: { is: 10 }
end
