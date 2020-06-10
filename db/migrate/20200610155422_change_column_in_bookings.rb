class ChangeColumnInBookings < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :customer_id, :integer
    change_column :bookings, :cleaner_id, :integer
  end
end
