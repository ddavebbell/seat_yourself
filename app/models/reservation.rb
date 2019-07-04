class Reservation < ApplicationRecord

	validates :guest_count, presence: true
	validates :reservation_time, presence: true

	belongs_to :open_day
	belongs_to :user
	belongs_to :restaurant
end
