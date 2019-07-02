class AddOpenDayIdToReservation < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :open_day_id, :integer
  end
end
