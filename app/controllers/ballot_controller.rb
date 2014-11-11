class BallotController < ApplicationController

	def index
		@ballots = Ballot.all
	end

	def show
		@ballot = Ballot.find(params[:id])
	end

	def new
		@ballot = Ballot.create()
		t = rand(2);
		if(t == 0)
			@ballot.organization = "n"
		else
			@ballot.organization = "s"
		end
		@ballot.save()
	end

	def create
		@ballot = Ballot.new(ballot_params)
		@ballot.save
	end

	private
	def ballot_params
		params.require(:ballot).permit(:organization)
	end

end
