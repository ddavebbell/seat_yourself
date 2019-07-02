class User < ApplicationRecord
	has_one :restaurant
	has_many :loyalty_points
	has_many :reservations
end
