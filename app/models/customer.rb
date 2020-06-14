class Customer < ApplicationRecord
  has_one :booking, dependent: :destroy

  accepts_nested_attributes_for :booking

  msg = "only letters allowed"
  
  validates :first_name, presence: true,
                         length: { maximum: 25 },
                         format: { with: VALID, message: "First name: #{msg}" }
  validates :last_name,  presence: true,
                         length: { maximum: 25 },
                         format: { with: VALID, message: "Last name: #{msg}" }
  validates :phone_number, length: { is: 12 },
                           uniqueness: true,
                           format: { with: /\d{3}[-]\d{3}[-]\d{4}/,
                                     message: "Incorrect format phone number" }

  def full_name
    "#{first_name} #{last_name}"
  end
end
