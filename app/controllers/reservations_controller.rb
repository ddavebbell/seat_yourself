class ReservationsController < ApplicationController

	def index
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
		@reservation.assign_attributes({ restaurant_id: params[:restaurant_id],
			user_id: params[:user_id] })
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
		if @reservation.reservation_time.between?(@restaurant.open_time, @restaurant.closing_time)
			@reservation.save
			render :show
			flash[:notice] = "You have made a reservation"
		elsif @reservation.reservation_time.between?(@restaurant.open_time, @restaurant.closing_time) == false
			flash[:alert] = "Reservation must be within business hours"
			redirect_to restaurant_reservations_url
		else
			@reservation.errors.full_messages
			redirect_to restaurant_reservations_url
		end
	end


end
