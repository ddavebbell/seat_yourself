class Reservation < ApplicationRecord
	belongs_to :open_day
	belongs_to :user
	belongs_to :restaurant
end
