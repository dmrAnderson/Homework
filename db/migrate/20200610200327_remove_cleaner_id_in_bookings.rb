class RemoveCleanerIdInBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :cleaner_id
  end
end
