class Reservation < ApplicationRecord

	validates :guest_count, presence: true
	validates :reservation_time, presence: true
	validate :reservation_size_is_within_capacity?
	validate :reservation_is_in_business_hours?

	belongs_to :open_day
	belongs_to :user
	belongs_to :restaurant

	def reservation_is_in_business_hours?
		restaurant = Restaurant.find_by(id: restaurant_id)
		unless reservation_time.between?(restaurant.open_time, restaurant.closing_time)
			errors.add(:reservation_time, 'must be within business hours')
		end
	end

	def reservation_size_is_within_capacity?
		errors.add(:guest_count, 'is too high') if guest_count > restaurant.reservation_max
		errors.add(:guest_count, 'is too low') if guest_count < restaurant.reservation_min
	end
end
