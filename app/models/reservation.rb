class Reservation < ApplicationRecord
	belongs_to :open_day
	belongs_to :user
end
