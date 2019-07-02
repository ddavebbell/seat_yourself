class CreateOpenDays < ActiveRecord::Migration[5.2]
  def change
    create_table :open_days do |t|
      t.datetime :date
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
