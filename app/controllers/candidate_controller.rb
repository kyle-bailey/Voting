class CandidateController < ApplicationController

	def show
		@candidate = Candidate.find(params[:id])
	end

	def create
		@candidate = Candidate.new(candidate_params)
	end

	private
	def candidate_params
		params.require(:candidate).permit(:name, :party, :race_id)
	end
end
