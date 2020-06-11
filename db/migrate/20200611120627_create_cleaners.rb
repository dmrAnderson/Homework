class CreateCleaners < ActiveRecord::Migration[6.0]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.float :quality_scope, default: 0.0
      t.boolean :employed, default: false

      t.timestamps
    end
  end
end
