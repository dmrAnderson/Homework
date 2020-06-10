class Cleaner < ApplicationRecord
  has_one :booking
  has_many :workplaces

  validates :first_name,    presence: true
  validates :last_name,     presence: true
  validates :quolity_scope, presence: true

  validate :quolity_scope_in_interval

  def quolity_scope_in_interval
    errors.add(:quolity_scope, 'Should be in an interval, between 0..5') if quolity_scope <= 5
  end
end
