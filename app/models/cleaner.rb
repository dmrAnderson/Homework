class Cleaner < ApplicationRecord
  has_many :workplaces, dependent: :destroy
  accepts_nested_attributes_for :workplaces, reject_if: lambda {|attributes| attributes["city_id"].blank?}
  # :reject_if => :all_blank
end
