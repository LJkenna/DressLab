class AddGarmentTypeColumnToItem < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :garment_type, :string
  end
end
