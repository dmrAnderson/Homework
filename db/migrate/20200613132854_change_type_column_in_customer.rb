class ChangeTypeColumnInCustomer < ActiveRecord::Migration[6.0]
  def change
    change_column :customers, :phone_number, :string
  end
end
