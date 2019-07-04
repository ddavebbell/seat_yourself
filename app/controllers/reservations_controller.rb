class ReservationsController < ApplicationController

	def index
		@restaurant = Restaurant.find(params[:restaurant_id])
		@reservation = Reservation.new
		@reservation.assign_attributes({ restaurant_id: params[:restaurant_id],
			user_id: params[:user_id] })
		@date = Date.today
	end

	def create
		@reservation = Reservation.new
		@reservation.assign_attributes({
			reservation_date: params[:reservation][:reservation_date],
			reservation_time: params[:reservation_time][:reservation_time].to_s,
			restaurant_id: params[:restaurant_id],
			guest_count: params[:reservation][:guest_count],
			user_id: current_user.id
			})
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
