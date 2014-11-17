class BallotController < ApplicationController

	def index
		@ballots = Ballot.all
	end

	def show
		@ballot = Ballot.find(params[:id])
		@races = @ballot.races
	end

	def new
		@ballot = Ballot.create()
		t = rand(2);
		if(t == 0)
			@ballot.organization = "n"
			@ballot.instructions = "How to Vote (Non-Sequential)"
		else
			@ballot.organization = "s"
			@ballot.instructions = "How To Vote (Sequential)"
		end
		@ballot.save()
		#want to create a set of races for each ballot
		redirect_to "/ballot/#{@ballot.id}/create_races"
	end

	def create
		@ballot = Ballot.new(ballot_params)
		@ballot.save
	end

	def create_races
		#create all the races for this ballot
		@ballot = Ballot.find(params[:id])
		@ballot.races.create(category:"President and Vice President", race_type:"Choose One", title:"U.S. President and Vice President", ballot_id: @ballot.id)
		@ballot.races.create(category:"Senator", race_type:"Choose One", title:"U.S. Senator", ballot_id: @ballot.id)
		@ballot.races.create(category:"Representative", race_type:"Choose One", title:"U.S. Representative", ballot_id: @ballot.id)
		@ballot.races.create(category:"Governor", race_type:"Choose One", title:"Governor", ballot_id: @ballot.id)
		redirect_to ballot_url(@ballot)
	end

	private
	def ballot_params
		params.require(:ballot).permit(:organization)
	end

end
