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

			if @reservation.save
				flash[:notice] = "You have made a reservation"
				redirect_to root_url
			elsif !business_hours(@reservation[:reservation_time])
				flash[:notice] = "Must be in business hours"
			else
				flash[:alert] = "Nothing happened"
				render :index
			end

	end
end
