class AddBookingIdToCleaner < ActiveRecord::Migration[6.0]
  def change
    add_column :cleaners, :booking_id, :integer
  end
end
