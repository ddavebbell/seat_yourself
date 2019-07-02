class Restaurant < ApplicationRecord
	belongs_to :user
	has_many :open_days
	has_many :reservations
end
