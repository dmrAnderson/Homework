class Customer < ApplicationRecord
  has_one :booking, dependent: :destroy

  accepts_nested_attributes_for :booking

  validates :first_name, presence: true, length: { maximum: 25 }, format: { with: VALID, message: MSG }
  validates :last_name, presence: true, length: { maximum: 25 }, format: { with: VALID, message: MSG }
  validates :phone_number, numericality: { only_integer: true }, length: { is: 10 }, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
