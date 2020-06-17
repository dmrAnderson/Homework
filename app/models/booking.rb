class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner, optional: true

  validates :city_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validate :correct_date_and_time

  def correct_date_and_time
    date_start = Date.tomorrow
    date_finish = Date.new(2021)
    unless (date_for_cleaning = date).nil?
      if (date_start <= date_for_cleaning) && (date_for_cleaning <= date_finish)
        time_start = Time.new(2020, 6, 13, 9).to_s(:time)
        time_finish = Time.new(2021, 6, 13, 18).to_s(:time)
        unless (cleaning_time = time).nil?
          unless (time_start <= cleaning_time.to_s(:time)) && (cleaning_time.to_s(:time) <= time_finish)
            errors.add(:time, "should be in 09.00..18.00")
          end
        end
      else
        errors.add(:date, "should be the correct.")
      end
    end
  end
end
