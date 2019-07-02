class CreateLoyaltyPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :loyalty_points do |t|
      t.integer :points
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end
