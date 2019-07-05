module ReservationsHelper

	require 'date'

	DAYS = %i[sunday monday tuesday wednesday thursday friday saturday]
	START_DAY = :monday

	def two_months_in_weeks(date)
		first = date.beginning_of_month.beginning_of_week(START_DAY)
		last = date.next_month.end_of_month.end_of_week(START_DAY)
		(first..last).to_a.in_groups_of(7)
	end

	def display_day_symbol(day)
		day.to_s.capitalize
	end

end
