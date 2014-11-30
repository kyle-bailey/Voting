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
		if t == 0
			@ballot.organization = "n" #non-sequential
		elsif t == 1
			@ballot.organization = "s" #sequential
		elsif t == 2
			@ballot.organization = "s_exp" #sequentail (explicit no-preference)
		end

		theme = rand(2)
		if theme == 0
			@ballot.theme == "rice"
		else
			@ballot.theme == "political"
		end

		@ballot.save()
		redirect_to "/ballot/#{@ballot.id}/create_races"
	end

	def create
		@ballot = Ballot.new(ballot_params)
		@ballot.save
	end

	def instructions
		@ballot = Ballot.find(params[:id])
		@races = @ballot.races
	end

	def create_races
		#create all the races for this ballot
		@ballot = Ballot.find(params[:id])

		if @ballot.theme == "political"

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

			#judge
			@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Presiding Judge Court of Criminal Appeals, Place 2", ballot_id: @ballot.id)
			@race.candidate.create(name: "Dan Plouffe", party: "REP", race_id: @race.id)
			@race.candidate.create(name: "Derrick Melgar", party: "DEM", race_id: @race.id)

			#district attorney
			@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"District Attorney", ballot_id: @ballot.id)
			@race.candidate.create(name: "Corey Behnke", party: "REP", race_id: @race.id)
			@race.candidate.create(name: "Jennifer A. Lundeed", party: "DEM", race_id: @race.id)

			#county treasurer
			@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"County Treasurer", ballot_id: @ballot.id)
			@race.candidate.create(name: "Dean Caffee", party: "REP", race_id: @race.id)
			@race.candidate.create(name: "Gordon Kallas", party: "DEM", race_id: @race.id)

			#sheriff
			@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"Sheriff", ballot_id: @ballot.id)
			@race.candidate.create(name: "Stanley Saari", party: "GP", race_id: @race.id)
			@race.candidate.create(name: "Jason Valle", party: "LIB", race_id: @race.id)

			#county tax assessor
			@race = @ballot.races.create(category:"State", race_type:"Choose One", title:"County Tax Assessor", ballot_id: @ballot.id)
			@race.candidate.create(name: "Howard Grady", party: "IND", race_id: @race.id)
			@race.candidate.create(name: "Randy H. Clemons", party: "CON", race_id: @race.id)

			#justice of the peace
			@race = @ballot.races.create(category:"Nonpartisan", race_type:"Choose One", title:"Justice of the Peace", ballot_id: @ballot.id)
			@race.candidate.create(name: "Deborah Kamps", race_id: @race.id)
			@race.candidate.create(name: "Clyde Gayton Jr.", race_id: @race.id)

			#county judge
			@race = @ballot.races.create(category:"Nonpartisan", race_type:"Choose One", title:"County Judge", ballot_id: @ballot.id)
			@race.candidate.create(name: "Dan Atchley", race_id: @race.id)
			@race.candidate.create(name: "Lewis Shine", race_id: @race.id)

			#prop 1
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 1", ballot_id: @ballot.id, description:"Without raising taxes and in order to pay for public safety, public works,parks and recreation, health care, libraries, and other essential services, shall Harris County and the City of Houston be authorized to retain and spend all city and county tax revenues in excess of the constitutional limitation on total city and county fiscal year spending for ten fiscal years beginning with the 2013 fiscal year, and to retain and spend an amount of city and tax revenues in excess of such limitation for the 2020 fiscal year and for each succeeding fiscal year up to the excess city and county revenue cap, as defined by this measure?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 2
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 2", ballot_id: @ballot.id, description:"Shall the Charter of Harris County beamended to authorize the City Council to review and approve certain intergovernmental agreements and revenue contracts entered into by the City; to permit the City Council to establish its meeting schedule by ordinance; to clarify the circumstances in which the City Council may act by ordinance or resolution; to permit the City Council to adopt by ordinance procedures for the formation and administration of special assessment districts; to permit excused absences of council members for reasons other than sickness; and to make other conforming amendments related thereto in order to eliminate redundant or obsolete provisions of the charter?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 3
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 3", ballot_id: @ballot.id, description:"Shall there be an amendment to the Texas constitution concerning recoveryof damages relating to construction of real property improvements, and, in connection therewith, prohibiting laws that limit or impair a property owner’s right to recover damages caused by a failure to construct an improvement in a good and workmanlike manner; defining “good and workmanlike manner” to include construction that is suitable for its intended purposes; and permitting exceptions for laws that limit punitive damages, afford governmental immunity, or impose time limits of specified minimum lengths on filing lawsuits?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 4
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 4", ballot_id: @ballot.id, description:"Shall there be an amendment to theTexas revised statutes concerning renewable energy standards for large providers of retail electric service, and, in connection therewith, defining eligible renewable energy resources to include solar, wind, geothermal, small hydroelectricity, and hydrogen fuel cells; requiring that a percentage of retail electricity sales be derived from renewable sources, beginning with 3% in the year 2013 and increasing to 10% by 2021; requiring utilities to offer consumers a rebate of $2.00 per watt and other incentives for solar electric generation; providing incentives for utilities to invest in renewable energy resources that provide net economic benefits to customers; limiting the retail rate impact of renewable energy resources to 50 cents per month for residential customers; requiring public utilities commission rules to establish major aspects of the measure; prohibiting utilities from using condemnation or eminent domain to acquire land for generating facilities used to meet the standards; requiring utilities with requirements contracts to address shortfalls from the standards; and specifying election procedures by which the customers of a utility may opt out of the requirements of the amendment?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 5
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 5", ballot_id: @ballot.id, description:"Shall there be an amendment to theTexas constitution concerning election day voter registration, and, in connection therewith, allowing an eligible citizen to register and vote on any day that a vote may be cast in any election beginning on January 1, 2013; specifying election day voter registration locations; specifying that an eligible citizen who registers to vote on election day shall register in person and present a current and valid Texas driver’s license or state identification card or other approved documentation; and directing the Texas general assembly, in implementing election day voter registration, to adopt necessary protections against election fraud?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 6
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 6", ballot_id: @ballot.id, description:"Shall the Charter of Harris Countyconcerning the powers of the City Council be amended in regard to the sale of city-owned property, to require Council approval for the sale of personal property valued at $500,000 or more, and to clarify language requiring Council approval of any sale of real property?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

		else 

			#double major
			@race = @ballot.races.create(race_type:"Choose One", title:"Hardest Double-major at Rice", ballot_id: @ballot.id)
			@race.candidate.create(name: "Mechanical Engineering and Statistics", race_id: @race.id)
			@race.candidate.create(name: "Math and Physics", race_id: @race.id)
			@race.candidate.create(name: "English and Philosophy", race_id: @race.id)

			#easiest distro
			@race = @ballot.races.create(race_type:"Choose One", title:"Easiest course distribution classification", ballot_id: @ballot.id)
			@race.candidate.create(name: "I (Humanities)", race_id: @race.id)
			@race.candidate.create(name: "II (Social Sciences)", race_id: @race.id)
			@race.candidate.create(name: "III (Natural Sciences and Engineering)", race_id: @race.id)

			#impactful org
			@race = @ballot.races.create(race_type:"Choose One", title:"Most impactful campus organization", ballot_id: @ballot.id)
			@race.candidate.create(name: "Leadership Rice", race_id: @race.id)
			@race.candidate.create(name: "Community Involvement Center", race_id: @race.id)

			#advisors
			@race = @ballot.races.create(race_type:"Choose One", title:"Most effective number of advisors per O-week group", ballot_id: @ballot.id)
			@race.candidate.create(name: "2 Advisors", race_id: @race.id)
			@race.candidate.create(name: "3 Advisors", race_id: @race.id)
			@race.candidate.create(name: "4 Advisors", race_id: @race.id)

			#servery
			@race = @ballot.races.create(race_type:"Choose One", title:"Servery most in need of a new head chef", ballot_id: @ballot.id)
			@race.candidate.create(name: "East Servery", race_id: @race.id)
			@race.candidate.create(name: "West Servery", race_id: @race.id)

			#inter college
			@race = @ballot.races.create(race_type:"Choose One", title:"Most effective inter-college bonding event", ballot_id: @ballot.id)
			@race.candidate.create(name: "Public Parties", race_id: @race.id)
			@race.candidate.create(name: "Intercollegiate picnics", race_id: @race.id)

			#apparel
			@race = @ballot.races.create(race_type:"Choose One", title:"Type of apparel Rice should provide more of", ballot_id: @ballot.id)
			@race.candidate.create(name: "T-shirts", race_id: @race.id)
			@race.candidate.create(name: "Hats", race_id: @race.id)

			#artist
			@race = @ballot.races.create(race_type:"Choose One", title:"Artist to perform at Rice", ballot_id: @ballot.id)
			@race.candidate.create(name: "Rascall Flatts", race_id: @race.id)
			@race.candidate.create(name: "Kesha", race_id: @race.id)

			#os
			@race = @ballot.races.create(race_type:"Choose One", title:"Best Operating System", ballot_id: @ballot.id)
			@race.candidate.create(name: "Mac OS X", race_id: @race.id)
			@race.candidate.create(name: "Windows 7", race_id: @race.id)

			#public
			@race = @ballot.races.create(race_type:"Choose One", title:"Best Rice Public Party", ballot_id: @ballot.id)
			@race.candidate.create(name: "NOD", race_id: @race.id)
			@race.candidate.create(name: "80's", race_id: @race.id)

			#college
			@race = @ballot.races.create(race_type:"Choose One", title:"College you would most want to be a member of", ballot_id: @ballot.id)
			@race.candidate.create(name: "Wiess", race_id: @race.id)
			@race.candidate.create(name: "Brown", race_id: @race.id)

			#fast food
			@race = @ballot.races.create(race_type:"Choose One", title:"Best fast-food restaurant", ballot_id: @ballot.id)
			@race.candidate.create(name: "Subway", race_id: @race.id)
			@race.candidate.create(name: "Chick-fil-A", race_id: @race.id)

			#renovations
			@race = @ballot.races.create(race_type:"Choose One", title:"Residential College most in need of renovations", ballot_id: @ballot.id)
			@race.candidate.create(name: "Hanszen College", race_id: @race.id)
			@race.candidate.create(name: "Lovett College", race_id: @race.id)

			#movie
			@race = @ballot.races.create(race_type:"Choose One", title:"Movie to be shown in the RMC", ballot_id: @ballot.id)
			@race.candidate.create(name: "The Lion King", race_id: @race.id)

			#study space
			@race = @ballot.races.create(race_type:"Choose One", title:"Best non-traditional study space", ballot_id: @ballot.id)
			@race.candidate.create(name: "Brochstein Pavilion", race_id: @race.id)
			@race.candidate.create(name: "Residential College Commons", race_id: @race.id)

			#lpaps
			@race = @ballot.races.create(race_type:"Choose One", title:"Number of LPAPs that should be required", ballot_id: @ballot.id)
			@race.candidate.create(name: "0 LPAPs", race_id: @race.id)
			@race.candidate.create(name: "1 or more LPAPs", race_id: @race.id)

			#bikers
			@race = @ballot.races.create(race_type:"Choose One", title:"Number of bikers per race for Beer Bike", ballot_id: @ballot.id)
			@race.candidate.create(name: "5-7 Bikers", race_id: @race.id)
			@race.candidate.create(name: "8-10 Bikers", race_id: @race.id)

			#rpc
			@race = @ballot.races.create(race_type:"Choose One", title:"RPC event that should receive greater funding", ballot_id: @ballot.id)
			@race.candidate.create(name: "Esperanza", race_id: @race.id)
			@race.candidate.create(name: "Willy Week", race_id: @race.id)

			#sport
			@race = @ballot.races.create(race_type:"Choose One", title:"Varsity Sport to be added at Rice", ballot_id: @ballot.id)
			@race.candidate.create(name: "Lacrosse", race_id: @race.id)
			@race.candidate.create(name: "Field Hockey", race_id: @race.id)

			#homecoming
			@race = @ballot.races.create(race_type:"Choose One", title:"Preferred Homecoming Performance", ballot_id: @ballot.id)
			@race.candidate.create(name: "Magician", race_id: @race.id)
			@race.candidate.create(name: "Comedian", race_id: @race.id)

			#student run
			@race = @ballot.races.create(race_type:"Choose One", title:"Best Student-run business", ballot_id: @ballot.id)
			@race.candidate.create(name: "The Hoot", race_id: @race.id)
			@race.candidate.create(name: "Coffeehouse", race_id: @race.id)

			#prop 1
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 1", ballot_id: @ballot.id, description:"Shall the Esther Waitlist System become a mandatory feature of all classes at Rice?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 2
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 2", ballot_id: @ballot.id, description:"Shall the GSA continue to be included in Residential College sports competitions and thus remain eligible to win the President’s Cup?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 3
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 3", ballot_id: @ballot.id, description:"Shall Rice support a proposed educational exemption of the drinking age?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 4
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 4", ballot_id: @ballot.id, description:"Shall there be an amendment to the Rice Alcohol Policy that institutes a permanent ban on hard alcohol (defined as 40 proof and above) on Rice Campus?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 5
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 5", ballot_id: @ballot.id, description:"Shall there be a twelfth residential college built to allow for increased student enrollment?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

			#prop 6
			@race = @ballot.races.create(category:"Proposition", race_type:"Y/N", title:"Proposition 6", ballot_id: @ballot.id, description:"Shall the first floor of library be remodeled to make it into more of a social studying space?")
			@race.candidate.create(name: "Yes", race_id: @race.id)
			@race.candidate.create(name: "No", race_id: @race.id)

		end


		redirect_to "/ballot/#{@ballot.id}/instructions"
	end

	private
	def ballot_params
		params.require(:ballot).permit(:organization)
	end

end
