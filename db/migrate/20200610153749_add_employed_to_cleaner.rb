class AddEmployedToCleaner < ActiveRecord::Migration[6.0]
  def change
    add_column :cleaners, :employed, :boolean, default: false
  end
end
