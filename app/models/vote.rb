class Vote < ActiveRecord::Base
	belongs_to :race

	def show
		@vote = Vote.find(params[:id])
	end

	def create
		@vote = Vote.new(race_params)
	end

	private
	def vote_params
		params.require(:vote)
	end
end
