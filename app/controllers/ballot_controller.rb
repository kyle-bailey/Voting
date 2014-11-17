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
			@ballot.instructions = "Instructions for a non-sequential ballot"
		else
			@ballot.organization = "s"
			@ballot.instructions = "Instructions for a sequential ballot"
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

		#president/vice
		@race = @ballot.races.create(category:"President and Vice President", race_type:"Choose One", title:"President and Vice President", ballot_id: @ballot.id)
		@race.candidate.create(name: "Gordon Bearce, Nathan Maclean", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Vernon Stanley Albury, Richard Rigby", party: "DEM", race_id: @race.id)
		@race.candidate.create(name: "Janette Froman, Chris Aponte", party: "LIB", race_id: @race.id)

		#senator
		@race = @ballot.races.create(category:"Congressional", race_type:"Choose One", title:"United States Senator", ballot_id: @ballot.id)
		@race.candidate.create(name: "Cecile Cadieux", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Fern Brzezinski", party: "DEM", race_id: @race.id)
		@race.candidate.create(name: "Corey Dery", party: "IND", race_id: @race.id)

		#representative
		@race = @ballot.races.create(category:"Congressional", race_type:"Choose One", title:"Representative in Congress", ballot_id: @ballot.id)
		@race.candidate.create(name: "Pedro Brouse", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Robert Mettler", party: "DEM", race_id: @race.id)

		#governor
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Governor", ballot_id: @ballot.id)
		@race.candidate.create(name: "Glen Travis Lozier", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Rick Stickles", party: "DEM", race_id: @race.id)
		@race.candidate.create(name: "Maurice Humble", party: "IND", race_id: @race.id)

		#governor
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Lieutenent Governor", ballot_id: @ballot.id)
		@race.candidate.create(name: "Shane Terrio", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Cassie Principe", party: "DEM", race_id: @race.id)

		#attorney general
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Attorney General", ballot_id: @ballot.id)
		@race.candidate.create(name: "Tim Speight", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Rick Organ", party: "DEM", race_id: @race.id)

		#comptroller
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Comptroller of Public Accounts", ballot_id: @ballot.id)
		@race.candidate.create(name: "Therese Gustin", party: "IND", race_id: @race.id)
		@race.candidate.create(name: "Greg Converse", party: "DEM", race_id: @race.id)

		#land office
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Commissioner of General Land Office", ballot_id: @ballot.id)
		@race.candidate.create(name: "Sam Saddler", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Elise Ellzey", party: "DEM", race_id: @race.id)

		#agriculture
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Commissioner of Agriculture", ballot_id: @ballot.id)
		@race.candidate.create(name: "Polly Rylander", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Roberto Aron", party: "DEM", race_id: @race.id)

		#railroad
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Railroad Commissioner", ballot_id: @ballot.id)
		@race.candidate.create(name: "Jillian Balas", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Zachary Minick", party: "DEM", race_id: @race.id)

		#state senator
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"State Senator", ballot_id: @ballot.id)
		@race.candidate.create(name: "Ricardo Nigro", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Wesley Steven Millette", party: "DEM", race_id: @race.id)

		#state representative
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"State Representative District 134", ballot_id: @ballot.id)
		@race.candidate.create(name: "Petra Bencomo", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Susanne Rael", party: "DEM", race_id: @race.id)

		#board of education
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Member State Board of Education District 2", ballot_id: @ballot.id)
		@race.candidate.create(name: "Peter Varga", party: "REP", race_id: @race.id)
		@race.candidate.create(name: "Mark Baber", party: "DEM", race_id: @race.id)

		#judge
		@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Presiding Judge Texas Supreme Court Place 3", ballot_id: @ballot.id)
		@race.candidate.create(name: "Tim Grasty", party: "DEM", race_id: @race.id)


		redirect_to ballot_url(@ballot)
	end

	private
	def ballot_params
		params.require(:ballot).permit(:organization)
	end

end
