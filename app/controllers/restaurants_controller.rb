class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
		@reservations = Reservation.all
		@user = User.find(current_user.id) if current_user
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@reservations = @restaurant.reservations.where(
	    'reservation_date <= :two_months_from_now and reservation_date >= :today',
	    :two_months_from_now  => Time.now + 60.days,
	    :today => Time.now
		)
		@date = Date.today
		@users = User.all
	end

	def create
		@restaurant = Restaurant.new
		@restaurant.assign_attributes({
			address:	params[:restaurant][:address],
			reservation_max:	params[:restaurant][:reservation_max],
			reservation_min:	params[:restaurant][:reservation_min],
			summary:	params[:restaurant][:summary],
			name:	params[:restaurant][:name],
			open_time:	params[:restaurant][:open_time],
			closing_time: params[:restaurant][:closing_time],
			maximum_capacity: params[:restaurant][:maximum_capacity],
			user_id: current_user.id
		})
		@restaurant.save
		redirect_to root_url
	end

	def new
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
