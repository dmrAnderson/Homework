class CreateCleaners < ActiveRecord::Migration[6.0]
  def change
    create_table :cleaners do |t|
      t.string :first_name
      t.string :last_name
      t.float  :quolity_scope, default: 0.0

      t.timestamps
    end
  end
end
