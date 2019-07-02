class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.string :neighbourhood
      t.string :price_range
      t.text :picture_url
      t.text :summary
      t.text :menu
      t.integer :maximum_capacity
      t.integer :user_id

      t.timestamps
    end
  end
end
