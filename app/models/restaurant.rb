class Restaurant < ApplicationRecord
	belongs_to :user
	has_many :loyalty_points
	has_many :open_days
	has_many :reservations
end
