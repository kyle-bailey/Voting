class Race < ActiveRecord::Base

	def show
		@race = Race.find(params[:id])
	end

	def create
		@race = Race.new(race_params)
	end

	private
	def race_params
		params.require(:race).permit(:title, :description, :type)
	end

end
