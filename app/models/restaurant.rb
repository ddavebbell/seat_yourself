class Restaurant < ApplicationRecord
	belongs_to :restaurant_owner
	has_many :open_days
	has_many :reservations
	has_many :customers
end
