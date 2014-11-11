class Race < ActiveRecord::Base
	belongs_to :ballot
	has_one :vote
end
