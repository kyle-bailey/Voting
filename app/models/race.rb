class Race < ActiveRecord::Base
	belongs_to :ballot
	has_one :vote
	has_many :candidate
end
