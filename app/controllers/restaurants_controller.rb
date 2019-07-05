class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
		@reservations = Reservation.all
		@user = User.find(current_user.id)
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservations = Reservation.find( params[:id])
		@date = Date.today
		@users = User.all
	end

	def create
			@restaurant = Restaurant.new
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		@restaurant.assign_attributes({
			open_time:	params[:restaurant][:open_time],
			closing_time: params[:restaurant][:closing_time],
			maximum_capacity: params[:restaurant][:maximum_capacity]
			})
		@restaurant.save

		redirect_to restaurant_path
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end
end
