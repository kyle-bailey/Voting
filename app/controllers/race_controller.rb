class RaceController < ApplicationController

	def show
		@race = Race.find(params[:id])
	end

	def create
		@race = Race.new(race_params)
	end

	private
	def race_params
		params.require(:race).permit(:title, :description, :race_type)
	end

end
