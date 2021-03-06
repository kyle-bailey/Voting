class DemographicsController < ApplicationController

	def show
		@dem = Demographics.find(params[:id])
	end

	def create
		@dem = Demographics.new(demographics_params)
		@dem.save
	end

	def update
		@dem = Demographics.find(params[:id])
		@ballot = Ballot.find(@dem.ballot_id)
		if @dem.update_attributes(demographics_params)
			redirect_to "/ballot/#{@ballot.id}/instructions"
		else
			#handle failure
		end
	end

	private
	def demographics_params
		params.require(:demographics).permit(:age, :gender, :normal_vision, :visual_acuity, :visual_field, :reading_disability, :hearing_impairment, :native_english, :native_language, :political_affiliation, :other, :number_elections, :where_voted, :other_elections, :where_other, :absentee, :worried, :time_pressure, :prevent, :straight_party, :every_office, :unsure, :unsure_explanation, :how_satisfied, :race, :race_specification)
	end

end
