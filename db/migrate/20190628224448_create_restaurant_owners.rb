class CreateRestaurantOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_owners do |t|
      t.text :name
      t.text :password_digest

      t.timestamps
    end
  end
end
