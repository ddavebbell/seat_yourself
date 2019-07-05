class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.integer :user_id
      t.integer :restaurant_id
      t.integer :guest_count
      t.timestamps
    end
  end
end
