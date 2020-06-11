class CreateWorkplaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workplaces do |t|
      t.integer :cleaner_id
      t.integer :city_id

      t.timestamps
    end
  end
end
