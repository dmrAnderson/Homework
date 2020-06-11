class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :customer_id
      t.integer :cleaner_id
      t.integer :city_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
