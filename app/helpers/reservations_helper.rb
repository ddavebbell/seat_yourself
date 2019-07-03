module ReservationsHelper

	require 'date'

	DAYS = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
	START_DAY = :monday

	# display all days EXCEPT monday/tuesday for restaurant owner

	def two_months_in_weeks(date)
		first = date.beginning_of_month.beginning_of_week(START_DAY)
		last = date.next_month.end_of_month.end_of_week(START_DAY)
		(first..last).to_a.in_groups_of(7)
	end
end
