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
			@ballot.instructions = "Instructions for a non-sequential ballot"
		else
			@ballot.organization = "s"
			@ballot.instructions = "Instructions for a sequential ballot"
		end
		@ballot.save()
		#want to create a set of races for each ballot
		redirect_to ballot_url(@ballot)
	end

	def create
		@ballot = Ballot.new(ballot_params)
		@ballot.save
	end

	def create_races
		#create all the races for this ballot
		@ballot = Ballot.find(params[:id])
		@ballot.races.create()
	end

	private
	def ballot_params
		params.require(:ballot).permit(:organization)
	end

end
