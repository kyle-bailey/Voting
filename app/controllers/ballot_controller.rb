class BallotController < ApplicationController

	def index
		@ballots = Ballot.all
	end

	def show
		@ballot = Ballot.find(params[:id])
	end

	def create
		@ballot = Ballot.new(ballot_params)
		t = rand(2);
		if(t == 0)
			@ballot.type = "n"
		else
			@ballot.type = "s"
		end
		@ballot.save
	end

	private
	def ballot_params
		params.require(:ballot).permit(:type)
	end

end
