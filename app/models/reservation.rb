class Reservation < ApplicationRecord

	validates :guest_count, presence: true
	validates :reservation_time, presence: true
	validates :reservation_limit, presence: true
	validate :reservation_is_in_business_hours?

	belongs_to :open_day
	belongs_to :user
	belongs_to :restaurant

	def reservation_is_in_business_hours?
		restaurant = Restaurant.find_by(id: restaurant_id)
		reservation_time.between?(restaurant.open_time, restaurant.closing_time)
	end

	def reservation_limit
		guest_count <= restaurant.reservation_max
		guest_count >= restaurant.reservation_min
	end
end
