class AddCompletedColumnToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :completed, :boolean, default: false
  end
end
