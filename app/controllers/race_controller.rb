class RaceController < ApplicationController

	def show
		@race = Race.find(params[:id])
		@ballot = Ballot.find(@race.ballot_id)
		# @candidate = Candidate.where(selected: true) #candidate that has been selected
	end

	def create
		@race = Race.new(race_params)
		@race.candidate.build
	end

	# def submit_vote_and_go_to_next_race
	# 	#take the vote from the page and submit it for this race
	# 	#go to the next race if there is one
	# 	@race = Race.find(params[:id])
	# 	@ballot = Ballot.find(@race.ballot_id)
	# 	@next_race = Race.find_by_id(params[:id].to_i + 1)
	# 	if(@next_race)
	# 		redirect_to "/race/#{@next_race.id}"
	# 	else
	# 		redirect_to "/ballot/#{@ballot.id}"
	# 	end
	# end

	# def submit_vote_and_return
	# 	#for non-sequential ballots: submit the vote and return to overview page
	# 	@race = Race.find(params[:id])
	# 	@ballot = Ballot.find(@race.ballot_id)

	# 	#create/edit vote

	# 	redirect_to "/ballot/#{@ballot.id}" 
	# end

	def submit_vote
		@race = Race.find(params[:id])
		@ballot = Ballot.find(@race.ballot_id)
		@candidate = Candidate.find_by_name(params[:race][:selected]) #candidate selected
		@candidate.update_attribute(:selected, true); #update candidate's selected id  
		@vote = Vote.find_by_race_id(params[:id])   # find vote by race id 
		if (@vote)
			@old = Candidate.find_by_name(@vote.candidate)
			@old.update_attribute(:selected, false)
			@vote.update_attribute(:candidate, candidate)
		else 
			@vote = Vote.create(race.id, candidate); 
		end
	end 

	def update
	    @race = Race.find(params[:id])
		@ballot = Ballot.find(@race.ballot_id)
		respond_to do |format| 
			format.html {
				if(@ballot.organization == "s")
					@next_race = Race.find_by_id(params[:id].to_i + 1)
					if(@next_race)
						redirect_to "/race/#{@next_race.id}"
					else
						redirect_to "/ballot/#{@ballot.id}"
					end
				else 
					redirect_to "/ballot/#{@ballot.id}"
				end }
			format.js
		end
  	end

	private
	def race_params
		params.require(:race).permit(:title, :description, :race_type)
	end

end
