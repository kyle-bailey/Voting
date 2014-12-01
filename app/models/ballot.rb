class Ballot < ActiveRecord::Base
	has_many :races
	has_one :demographics
end
