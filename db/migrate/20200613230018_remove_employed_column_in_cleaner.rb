class RemoveEmployedColumnInCleaner < ActiveRecord::Migration[6.0]
  def change
    remove_column :cleaners, :employed, :boolean
  end
end
