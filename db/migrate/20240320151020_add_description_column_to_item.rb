class AddDescriptionColumnToItem < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :description, :text
  end
end
