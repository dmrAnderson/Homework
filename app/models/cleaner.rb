class Cleaner < ApplicationRecord
  has_many :workplaces, dependent: :destroy
  accepts_nested_attributes_for :workplaces, reject_if: lambda {|attributes| attributes["city_id"].blank?}
  # :reject_if => :all_blank

  default_scope -> { order(quality_scope: :desc) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
