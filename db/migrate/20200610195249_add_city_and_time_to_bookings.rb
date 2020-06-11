class AddCityAndTimeToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :city, :string
    add_column :bookings, :time, :time
  end
end
