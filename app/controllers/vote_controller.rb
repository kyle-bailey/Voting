class VoteController < ApplicationController

	def show
		@vote = Vote.find(params[:id])
	end

	def create
		@vote = Vote.new(vote_params)
	end

	private
	def vote_params
		params.require(:vote)
	end

end
