class RaceController < ApplicationController

	def show
		@race = Race.find(params[:id])
		@ballot = Ballot.find(@race.ballot_id)
	end

	def create
		@race = Race.new(race_params)
	end

	def submit_vote_and_go_to_next_race
		#take the vote from the page and submit it for this race
		#then go to the next race if there is one
	end

	private
	def race_params
		params.require(:race).permit(:title, :description, :race_type)
	end

end
