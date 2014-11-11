class Ballot < ActiveRecord::Base
	has_many :races

	def show
		@ballot = Ballot.find(params[:id])
	end

	def create
		@ballot = Ballot.new(race_params)
	end

	private
	def race_params
		params.require(:ballot).permit(:type)
	end

end
