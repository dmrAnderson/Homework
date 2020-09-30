class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner, optional: true

  validates :city_id, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validate :correct_date_and_time

  after_find :booking_completed, if: :cleaning_done?

  def correct_date_and_time
    date_start = Date.tomorrow
    date_finish = date_start.next_year
    if date.present? && date.between?(date_start, date_finish)
      time_start = Time.new(date_start.year, date_start.month, date_start.day, 9).to_s(:time)
      time_finish = Time.new(date_start.year, date_start.month, date_start.day, 18).to_s(:time)
      unless time.present? && time.between?(time_start, time_finish)
        errors.add(:time, "should be in #{time_start}..#{time_finish}")
        puts "TIME"
      end
    else
      errors.add(:date, "should be in #{date_start}..#{date_finish}")
      puts "DATE"
    end
  end

  private

  def booking_completed
    toggle!(:completed)
  end

  def cleaning_done?
    completed ? false : date < Time.now
  end
end
