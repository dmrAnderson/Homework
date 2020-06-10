class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :cleaner,  null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
