class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :brand
      t.integer :size
      t.string :color
      t.integer :price
      t.string :type
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
