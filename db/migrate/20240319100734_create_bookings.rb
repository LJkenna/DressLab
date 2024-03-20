class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.date :rent_start_date
      t.date :rent_end_date
      t.float :total_amount
      t.integer :status

      t.timestamps
    end
  end
end
