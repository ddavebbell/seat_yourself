class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :price_range
      t.text :picture_url
      t.text :summary
      t.text :menu
      t.integer :maximum_capacity
      t.integer :user_id
      t.time :open_time
      t.time :closing_time
      t.integer :reservation_min
      t.integer :reservation_max
      t.timestamps
    end
  end
end
