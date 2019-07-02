class ReservationsController < ApplicationController
	def index
		@date = Date.today
	end
end
