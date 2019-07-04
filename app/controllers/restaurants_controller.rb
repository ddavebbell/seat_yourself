class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])
		@restaurant.assign_attributes({
			open_time:	params[:restaurant][:open_time],
			closing_time: params[:restaurant][:closing_time],
			maximum_capacity: params[:restaurant][:maximum_capacity]
			})

		redirect_to restaurant_path
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	private

	def validate_reservation_parameters
		if @reservation.save
			flash[:notice] = "You have made a reservation"
		elsif reservation_is_in_business_hours(@reservation[:reservation_time]) == false
		else
			flash[:alert] = "Nothing happened"
			render :new
		end
	end


end
