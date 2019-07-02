class Customer < ApplicationRecord
	has_many :reservations
	has_many :loyalty_points
end
