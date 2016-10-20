# Will seed the whole database on deployment using Jay Hammond's data.
# Kyle N. Smith


require 'csv'
require 'date'

csv2_text = File.read(Rails.root.join('lib', 'seeds', 'Seasons.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)

wrsc1.each do |wr|
	if wr[0]
	# if wr[0] == !object.nil? 
	# sample = wr[0]
	# if sample.
		# p wr[0].to_i.class
	# end
  Season.create(year: wr[0].to_i, location: wr[5])
	end
end
p "Seasons Created"


# Seed wrestler list (must use the already established numbers)
csv_text = File.read(Rails.root.join('lib', 'seeds', 'test.csv'))
csv = CSV.parse(csv_text, :headers => true)
for i in 1..16154
	t = Wrestler.new
	t.save
end
csv.each do |row|
  Wrestler.find(row[0]).update(name: row[1], hofid: row[2], all_american: row[3], transfer: row[4], division_i: row[5], high_school: row[13], state_id: row[14].to_i)
end
p "Wrestlers Created"



# # Seed the list of schools (colleges) using the already established IDs
csv2_text = File.read(Rails.root.join('lib', 'seeds', 'school.csv'))
sc= CSV.parse(csv2_text, :headers => true)

for i in 1..534
	t = School.new
	t.save
end
sc.each do |row|
  School.find(row[0]).update(hof_id: row[1], name: row[2], current_division: row[3], city: row[5], state_id: row[6], active: row[4])
end
p "School Created"

# # Seed join table for wrestler and their school (college) using the already established IDs
csv1_text = File.read(Rails.root.join('lib', 'seeds', 'wrestlerschool.csv'))
wrsc = CSV.parse(csv1_text, :headers => true)

wrsc.each do |wr|
  WrestlerSchool.create(season_id: wr[0].to_i, wrestler_id: wr[1], school_id: wr[2])
end
p "WresterSchool Created"


csv1_text = File.read(Rails.root.join('lib', 'seeds', 'AllAmericans.csv'))
wrsc = CSV.parse(csv1_text, :headers => true)
p "running AllAmerican"
wrsc.each do |wr|
  AllAmerican.create(division_id: wr[0], season_id: wr[1], weight: wr[2], place: wr[3], wrestler_id: wr[4], school_id: wr[5])
end
p "AllAmerican Created"


# Still need to write the associations for the contestant models
csv1_text = File.read(Rails.root.join('lib', 'seeds', 'Contestants.csv'))
wrsc = CSV.parse(csv1_text, :headers => true)

# Season	Weight	Bracket	Round	Winner	Loser	Score	Decision Type
wrsc.each do |wr|
  Contestant.create(season_id: wr[0], weight: wr[1], wrestler_id: wr[2], bracket_position: wr[3], consolation_position: wr[4], seed: wr[5], place: wr[6])
end







csv2_text = File.read(Rails.root.join('lib', 'seeds', 'Bouts.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
wrsc1.each do |wr|

	 # winner: wr[4],
  Bout.create(season_id: wr[0], weight: wr[1], bracket: wr[2], round: wr[3], winner_id: wr[4], loser_id: wr[5], score: wr[6], decision_type: wr[7])
end
p "Bout Created"

csv2_text = File.read(Rails.root.join('lib', 'seeds', 'AAPlaceWinners.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)

wrsc1.each do |wr|
  AaPlaceWinner.create(wrestler_id: wr[0], division_id: wr[1], school_id: wr[2], season_id: wr[3], weight: wr[4], place: wr[5], ordinal: wr[6])
end
p "AAPlaceWinner Created"



csv2_text = File.read(Rails.root.join('lib', 'seeds', 'OutstandingWrestler.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)

wrsc1.each do |wr|
  OutstandingWrestler.create(division_id: wr[0], wrestler_id: wr[2], school_id: wr[3], season_id: wr[1])
end
p "OutstandingWrestler Created"

csv2_text = File.read(Rails.root.join('lib', 'seeds', 'Divisions.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)

wrsc1.each do |wr|
  Division.create(event: wr[1], alternate_name: wr[2], start_year: wr[3])
end
p "Division Created"




csv2_text = File.read(Rails.root.join('lib', 'seeds', 'DualsSeason.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
# Season	School ID	Division ID	Coach ID	Duals	Wins	Losses	Ties	Non DI
	

wrsc1.each do |wr|
	# def coach_num
	# 	if wr[3] == 0
	# 		2
	# 	else
	# 		wr[3]
	# 	end
	# end
  DualSeason.create(season_id: wr[0], school_id: wr[1], division_id: wr[2], coach_id: wr[3] == 0 ? 2 : wr[3], duals: wr[4], wins: wr[5], losses: wr[6], ties: wr[7], non_di: wr[8])
end
p "DualSeasons Created"





# Need to add date field to dualmeets and also need to decide how to merge dual meets




csv2_text = File.read(Rails.root.join('lib', 'seeds', 'DualMeets.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
wrsc1.each do |wr|

	if wr[3]
		 dated = wr[3].split('/')
		def add_zero(date)
			if date.length == 1
				"0#{date}"
			else
				 date.to_s
			end
		end

		def yearize(month, seas)
			num = month.to_i
			if num.between?(0, 6)	
				seas.to_i
			else 
				seas.to_i - 1
			end		
		end
		yr = yearize(dated[0], wr[1])
		mon = add_zero(dated[0])
		day = add_zero(dated[1])
		
	# p "++++++++++++++++++++++++++"
	# p "#{yr}-#{mon}-#{day} is in #{wr[1]} season"
		# dater = Date.parse("#{yr}-#{mon}-#{day}")
		dater = DateTime.new(yr, mon, day)
	# 	p dater
	# 	p "++++++++++++++++++++++++++"
		if Dual.find_by(team2_id: wr[0], season_id: wr[1], team1_id: wr[6], team2_score: wr[7], team1_score: wr[8])
			next
		elsif Dual.find_by(team1_id: wr[0], season_id: wr[1], team2_id: wr[6], team1_score: wr[7], team2_score: wr[8])
			next
		elsif Dual.find_by(team1_id: wr[0], season_id: wr[1], team2_id: wr[6], team1_score: wr[8], team2_score: wr[7])
			next
		elsif Dual.find_by(team2_id: wr[0], season_id: wr[1], team1_id: wr[6], team2_score: wr[8], team1_score: wr[7])
			next
			
		else
			dualer = Dual.create(date: dater, team1_id: wr[0], season_id: wr[1], team2_id: wr[6], team1_score: wr[7], team2_score: wr[8], t: wr[12])
			if wr[10].to_i == 1
				 dualer.update(w: wr[0], l: wr[6])
			elsif wr[11].to_i == 1
				dualer.update(w: wr[6], l: wr[0])
			end
		end




	else
		if Dual.find_by(team2_id: wr[0], season_id: wr[1], team1_id: wr[6], team2_score: wr[7], team1_score: wr[8])
			next
		elsif Dual.find_by(team1_id: wr[0], season_id: wr[1], team2_id: wr[6], team1_score: wr[7], team2_score: wr[8])
			next
		elsif Dual.find_by(team1_id: wr[0], season_id: wr[1], team2_id: wr[6], team1_score: wr[8], team2_score: wr[7])
			next
		elsif Dual.find_by(team2_id: wr[0], season_id: wr[1], team1_id: wr[6], team2_score: wr[8], team1_score: wr[7])
			next
			
		else
			dualer = Dual.create(team1_id: wr[0], season_id: wr[1], team2_id: wr[6], team1_score: wr[7], team2_score: wr[8], t: wr[12])
			if wr[10].to_i == 1
				 dualer.update(w: wr[0], l: wr[6])		
			elsif wr[11].to_i == 1
				dualer.update(w: wr[6], l: wr[0])
			end
		end
	end

	

	# Removed the checker on wr[5] so that it would populate zeor rather than nil.
	if wr[5]
		 if wr[5][0].downcase == "h"
			location = 1
		elsif wr[5][0].downcase == "a"
			location = 2
		elsif wr[5][0].downcase == "n"
			location = 3
		else
			location = 0
		end
	else 
		location = 0
	end
	dualer.update(site: location)
	

end
p "DualMeets Created"




csv2_text = File.read(Rails.root.join('lib', 'seeds', 'Duals.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
ct = 0
wrsc1.each do |wr|
	score = wr[3].split('-')
	if Dual.find_by(team1_id: wr[0], team2: wr[1], season_id: wr[2], team1_score: score[0], team2_score: score[1])
		next
	elsif Dual.find_by(team1_id: wr[1], team2_id: wr[0], season_id: wr[2], team1_score: score[1], team2_score: score[2])
		next
	else	
	dualer = Dual.create(team1_id: wr[0], team2_id: wr[1], season_id: wr[2], team1_score: score[0], team2_score: score[1], t: wr[6])
		if wr[4] 
			 dualer.update(w: wr[0], l: wr[1], complete: true)		
		elsif wr[5]
			dualer.update(w: wr[1], l: wr[0], complete: true)
		end
	end
  
  # Dual.create(school_id: wr[0], opponent_id: wr[1], season_id: wr[2], score: wr[3], win: wr[4], loss: wr[5], tie: wr[6])
end
p "Duals Created"


 # need to do date here as well....




csv2_text = File.read(Rails.root.join('lib', 'seeds', 'TeamRankingRelease.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
# Season	School ID	Division ID	Coach ID	Duals	Wins	Losses	Ties	Non DI
wrsc1.each do |wr|
	dated = wr[1].split('/')
	def add_zero(date)
		if date.length == 1
			"0#{date}"
		else
			 date.to_s
		end
	end

	def yearize(form, seas)
		num = form.to_i
		if num.between?(0, 20)	
			"20#{form}"
		else 	
			"19#{form}"
		end
		
	end
	mon = add_zero(dated[0])
	day = add_zero(dated[1])
	yr = yearize(dated[2], wr[0])



	@ndate = DateTime.new(yr, mon, day)
	# @ndate = Date.parse("#{yr}-#{mon}-#{day}")
	# '#{yr}-#{mon}-#{day}'
	#  

	# p @ndate

	def namer(state)
		if state == true
			"NWCA/USA Today Division I Team Coaches Poll"
		else
			"unknown"
		end
	end

	# Season	Date	Teams Ranked	NWCA
	TeamRankingRelease.create(season_id: wr[0], date: @ndate, teams_ranked: wr[2], nwca: wr[3], poll_name: namer(wr[3]), dual_ranking: 1, date_text: wr[1])
# date: to_timestamp(wr[3], MM/DD/YY),
end
p "Polls (TRR) Created"

csv2_text = File.read(Rails.root.join('lib', 'seeds', 'TeamRanking.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
# Season	School ID	Division ID	Coach ID	Duals	Wins	Losses	Ties	Non DI
wrsc1.each do |wr|
	dated = wr[1].split('/')
	def add_zero(date)
		if date.length == 1
			"0#{date}"
		else
			 date.to_s
		end
	end

	def yearize(form, seas)
		num = form.to_i
		if num.between?(0, 20)	
			"20#{form}"
		else 
			
			"19#{form}"
		end
		
	end
	mon = add_zero(dated[0])
	day = add_zero(dated[1])
	yr = yearize(dated[2], wr[0])



	@ndate = DateTime.new(yr, mon, day)
	# @ndate = Date.parse("#{yr}-#{mon}-#{day}")

	@tie = TeamRankingRelease.find_or_create_by(season_id: wr[0], date: @ndate, date_text: wr[1], division_id: 1)


 # p @tie.id
	TeamRanking.create(season_id: wr[0], team_ranking_release_id: @tie.id, rank: wr[2], school_id: wr[3])
# date: to_timestamp(wr[3], MM/DD/YY),
end
p "TeamRanking Created"


# # Seed the list of coaches.
csv2_text = File.read(Rails.root.join('lib', 'seeds', 'HeadCoach.csv'))
sc= CSV.parse(csv2_text, :headers => true)

for i in 1..1254
	t = Coach.new
	t.save
end
sc.each do |row|
  Coach.find(row[0]).update(name: row[1], fname: row[3], lname: row[2], active: row[4], total_seasons: row[5], total_duals: row[6], total_wins: row[7], total_losses: row[8], total_ties: row[9], win_percentage: row[10], total_champs: row[11], total_aas: row[12], aa_percentage: row[14], champ_percentage: row[13])
end
p "Coach Created"

AllAmerican.sort_data
AaPlaceWinner.sort_data

p "Data Cross References"

# Shouldn't need to run this as coach_id = 0 has been removed.
DualSeason.where(coach_id: 0).each do |bar|
	bar.update(coach_id: 2)
end
p "DualSeason data cleaned"


# # Division_id,Season,HOFEventID,Ordinal,Start Date,End Date,Location,Team Champion,Champs,Points,Outstanding Wrestler,OW School,Schools,Participants,Total Points,Weight Classes,Places


csv2_text = File.read(Rails.root.join('lib', 'seeds', 'D1Event.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)


wrsc1.each do |wr|
	started = wr[4].split('/')
	ended = wr[5].split('/')
	def add_zero(date)
		if date.length == 1
			"0#{date}"
		else
			 date.to_s
		end
	end

	def yearize(form, seas)
		num = form.to_i
		if num.between?(0, 20)	
			"20#{form}"
		else 
			
			"19#{form}"
		end
		
	end
	mon1 = add_zero(started[0])
	day1 = add_zero(started[1])
	yr1 = yearize(started[2], wr[1])
	mon2 = add_zero(ended[0])
	day2 = add_zero(ended[1])
	yr2 = yearize(ended[2], wr[1])


	@ended = DateTime.new(yr2, mon2, day2)
	# @ended = Date.parse("#{yr2}-#{mon2}-#{day2}")
	@started = DateTime.new(yr1, mon1, day1)
	# @started = Date.parse("#{yr1}-#{mon1}-#{day1}")
	@athlete = Wrestler.find_by_name(wr[10])
	@div = Division.find(wr[0])
	@season = Season.find(wr[1])

# This helper is failing
	@namer = ApplicationHelper.find_event(@div, @season.id)
# This helper is failing
  Event.create(division_id: wr[0], season_id: wr[1], hofeventid: wr[2], ordinal: wr[3], start_date: @started, end_date: @ended, location: wr[6], team_champion: wr[7], champs: wr[8], winners_points: wr[9], outstanding_wrestler: wr[10], ow_wrestler_id: @athlete, ow_school_id: wr[11], total_schools: wr[12], total_participants: wr[13], total_points: wr[14], weight_classes: wr[15], places: wr[16])
end
p "D1Event Created"

csv2_text = File.read(Rails.root.join('lib', 'seeds', 'D2Event.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)


wrsc1.each do |wr|
	started = wr[4].split('/')
	ended = wr[5].split('/')
	def add_zero(date)
		if date.length == 1
			"0#{date}"
		else
			 date.to_s
		end
	end

	def yearize(form, seas)
		num = form.to_i
		if num.between?(0, 20)	
			"20#{form}"
		else 
			
			"19#{form}"
		end
		
	end
	mon1 = add_zero(started[0])
	day1 = add_zero(started[1])
	yr1 = yearize(started[2], wr[1])
	mon2 = add_zero(ended[0])
	day2 = add_zero(ended[1])
	yr2 = yearize(ended[2], wr[1])



	@ended = DateTime.new(yr2, mon2, day2)
	# @ended = Date.parse("#{yr2}-#{mon2}-#{day2}")
	@started = DateTime.new(yr1, mon1, day1)
	# @started = Date.parse("#{yr1}-#{mon1}-#{day1}")
	# @athlete = Wrestler.find_by_name(wr[10])
	@div = Division.find(wr[0])
	@season = Season.find(wr[1])

# This helper is failing
	@namer = ApplicationHelper.find_event(@div, @season.id)
# This helper is failing
  Event.create(division_id: wr[0], season_id: wr[1], hofeventid: wr[2], ordinal: wr[3], start_date: @started, end_date: @ended, location: wr[6], team_champion: wr[7], weight_classes: wr[10], places: wr[11])
end

p "D2Event Created"

csv2_text = File.read(Rails.root.join('lib', 'seeds', 'D3Event.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)


wrsc1.each do |wr|
	started = wr[4].split('/')
	ended = wr[5].split('/')
	def add_zero(date)
		if date.length == 1
			"0#{date}"
		else
			 date.to_s
		end
	end

	def yearize(form, seas)
		num = form.to_i
		if num.between?(0, 20)	
			"20#{form}"
		else 
			
			"19#{form}"
		end
		
	end
	mon1 = add_zero(started[0])
	day1 = add_zero(started[1])
	yr1 = yearize(started[2], wr[1])
	mon2 = add_zero(ended[0])
	day2 = add_zero(ended[1])
	yr2 = yearize(ended[2], wr[1])



	@ended = DateTime.new(yr2, mon2, day2)
	# @ended = Date.parse("#{yr2}-#{mon2}-#{day2}")
	@started = DateTime.new(yr1, mon1, day1)
	# @started = Date.parse("#{yr1}-#{mon1}-#{day1}")
	# @athlete = Wrestler.find_by_name(wr[10])
	@div = Division.find(wr[0])
	@season = Season.find(wr[1])

# This helper is failing
	@namer = ApplicationHelper.find_event(@div, @season.id)
# This helper is failing
  Event.create(division_id: wr[0], season_id: wr[1], hofeventid: wr[2], ordinal: wr[3], start_date: @started, end_date: @ended, location: wr[6], team_champion: wr[7], weight_classes: wr[10], places: wr[11])
end
p "D3Event Created"






OutstandingWrestler.all.each do |ow|
	@namer = ApplicationHelper.find_event(ow.division, ow.season_id)
	# p @namer
	@ev = Event.find_or_create_by(division_id: ow.division_id, season_id: ow.season_id)
	def ncaa(event)
		if event[0] != "N"
			"NCAA #{event} Championship"
		else
			event
		end
	end
	@namer = ncaa(@namer)

	@ev.update(name: @namer)
	@ev.save
	ow.update(event_id: @ev)
end

p "Associations Created for OWS and Events"








csv2_text = File.read(Rails.root.join('lib', 'seeds', 'TeamScores.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => true)
wrsc1.each do |wr|
	if wr[3]
		coach = wr[3]
	else
		if DualSeason.find_by(season_id: wr[1], school_id: wr[2])
			ds = DualSeason.find_by(season_id: wr[1], school_id: wr[2])
			if ds.coach_id == 0
				coach = 2
			else
			coach = ds.coach_id
			end
		else
			coach = nil
		end
	end
	@ev = Event.find_or_create_by(division_id: wr[0], season_id: wr[1])
	# Division ID	Season	School ID	Coach ID	Points	Place	Champs	Place Winners
  TeamScore.create(event_id: @ev.id, division_id: wr[0], season_id: wr[1], school_id: wr[2], coach_id: coach, points: wr[4], place: wr[5], champs: wr[6], place_winners: wr[7])
end

p "TeamScore Created"






for i in 2010..2030 
 Season.find_or_create_by(year: i)
end

p "Created future seasons"



AaPlaceWinner.all.each do |place|
	@ev = Event.find_by(division_id: place.division_id, season_id: place.season_id)
if @ev 
	place.update(event_id: @ev.id)
	place.save
	end

end

AllAmerican.all.each do |place|
	@ev = Event.find_by(division_id: place.division_id, season_id: place.season_id)

if @ev 
	place.update(event_id: @ev.id)
	place.save
	end

end

p "Events added to All-Americans and Placers"



csv2_text = File.read(Rails.root.join('lib', 'seeds', 'States.csv'))
wrsc1 = CSV.parse(csv2_text, :headers => false)

wrsc1.each do |wr|
  State.create(name: wr[1], abv: wr[2])
end
p "States created Created"




School.where(name: nil).delete_all

p "Killed all free floating school records"










