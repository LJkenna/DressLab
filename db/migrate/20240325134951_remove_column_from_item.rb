class RemoveColumnFromItem < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :category, :string
  end
end
