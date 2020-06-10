class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string  :first_name
      t.string  :last_name
      t.integer :phone_number

      t.timestamps
    end
    add_index :customers, :phone_number, unique: true
  end
end
