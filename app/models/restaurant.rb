class Restaurant < ApplicationRecord
	belongs_to :user
	has_many :loyalty_points
	has_many :open_days
	has_many :reservations

validate :reservation_validation

	def reservation_is_in_business_hours(reservation_time)
		@restaurant = Restaurant.find(params[:restaurant_id])
		reservation_time.between?(@restaurant.open_time, @restaurant.closing_time)
	end

def reservation_validation
	if @reservation.save
		flash[:notice] = "You have made a reservation"
		redirect_to root_url
	elsif reservation_is_in_business_hours(@reservation[:reservation_time]) == false
		flash[:notice] = "Must be in business hours"
	else
		flash[:alert] = "Nothing happened"
		render :new
	end
end


end
