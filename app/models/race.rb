class Race < ActiveRecord::Base
	belongs_to :ballot
	has_one :vote
	has_many :candidate
	accepts_nested_attributes_for :candidate
end
