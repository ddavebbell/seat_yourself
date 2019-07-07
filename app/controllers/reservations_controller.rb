class ReservationsController < ApplicationController
	include TimeUtility

	def index
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
		@date = Date.today
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
		@reservation.assign_attributes({
			reservation_date: params[:reservation][:reservation_date],
			reservation_time: params[:reservation_time][:reservation_time].to_s,
			restaurant_id: params[:restaurant_id],
			guest_count: params[:reservation][:guest_count],
			user_id: current_user.id
		})
		validate_reservation_parameters
	end

	private

	def validate_reservation_parameters
		if @reservation.save
			flash[:alert] = "You have made a reservation"
			redirect_to restaurant_reservations_url
		else
			flash[:alert] = @reservation.errors.full_messages
			redirect_to restaurant_reservations_url
		end
	end
end
