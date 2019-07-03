class RestaurantsController < ApplicationController
	def index
		@restaurants = Restaurant.all
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end

	def profile
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		@restaurant.assign_attributes({
		open_time:	params[:restaurant][:open_time],
		closing_time: params[:restaurant][:closing_time]	})

		@restaurant.save
		redirect_to restaurant_path
	end

	def edit

	end
end
