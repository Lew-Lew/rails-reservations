class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coworking, null: false, foreign_key: true
      t.time :start_time
      t.time :end_time
      t.float :total_price

      t.timestamps
    end
  end
end
