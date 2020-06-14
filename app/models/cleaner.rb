class Cleaner < ApplicationRecord
  has_many :workplaces, dependent: :destroy
  has_many :bookings

  accepts_nested_attributes_for :workplaces,
                                reject_if: proc { |attr| attr[:city_id].blank?}

  msg = "only letters allowed"

  validates :first_name, presence: true, 
                         length: { maximum: 25 },
                         format: { with: VALID, message: "First name: #{msg}" }
  validates :last_name,  presence: true,
                         length: { maximum: 25 },
                         format: { with: VALID, message: "Last name: #{msg}"}
  validates :quality_scope, presence: true,
                            numericality: { only_float: true,
                                            greater_than_or_equal_to: 0.0,
                                            less_than_or_equal_to: 5.0 }

  default_scope -> { order(quality_scope: :desc) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
