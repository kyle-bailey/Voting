class VoteController < ApplicationController

	def show
		@vote = Vote.find(params[:id])
	end

	def create
		@vote = Vote.new(vote_params)
		@vote.save()
	end

	private
	def vote_params
		params.require(:vote).permit(:race_id, :candidate)
	end

end
