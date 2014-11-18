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
		#TODO
		#go to the next race if there is one
		@race = Race.find(params[:id])
		@ballot = Ballot.find(@race.ballot_id)
		@next_race = Race.find_by_id(params[:id].to_i + 1)
		if(@next_race)
			redirect_to "/race/#{@next_race.id}"
		else
			redirect_to "/ballot"
		end
	end

	def submit_vote_and_return
		#for non-sequential ballots: submit the vote and return to overview page
		@race = Race.find(params[:id])
		@ballot = Ballot.find(@race.ballot_id)

		#create/edit vote

		redirect_to "/ballot/#{@ballot.id}" 
	end

	private
	def race_params
		params.require(:race).permit(:title, :description, :race_type)
	end

end
