class ReservationsController < ApplicationController
	def index
		@reservation = Reservation.new
		@date = Date.today
	end
end
