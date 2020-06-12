class Customer < ApplicationRecord
  has_one :booking, dependent: :destroy
  accepts_nested_attributes_for :booking
  
  def full_name
    "#{first_name} #{last_name}"
  end
end
