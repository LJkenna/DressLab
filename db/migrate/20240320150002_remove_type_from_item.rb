class RemoveTypeFromItem < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :type, :string
  end
end
