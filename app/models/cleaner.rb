class Cleaner < ApplicationRecord
  has_many :workplaces, dependent: :destroy
  has_many :bookings

  accepts_nested_attributes_for :workplaces, reject_if: proc { |attr| attr[:city_id].blank?}

  validates :first_name, presence: true, length: { maximum: 25 }, format: { with: VALID, message: MSG }
  validates :last_name, presence: true, length: { maximum: 25 }, format: { with: VALID, message: MSG }
  validates :quality_scope, presence: true, length: { in: 0..5 }
  validates :employed, acceptance: { accept: [true, false] }

  default_scope -> { order(quality_scope: :desc) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
