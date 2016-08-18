module ApplicationHelper

	# Returns whatever a championship division was called at the time of the contest
	def self.find_event(division, season)
		if season <= 1973 && division.alternate_name != nil
			division.alternate_name
		else
			division.event 
		end
	end

	# Returns the weight class wrestled when all american honors were earned
	def self.find_weight(wr_id, season_id, event_id)
		puts " wr_id ************* #{wr_id} ************* "
		puts " season_id ************* #{season_id} ************* "
		puts " event_id ************* #{event_id} ************* "
		puts " ************* ************* "
		 value = AllAmerican.find_by(wrestler_id: wr_id, season: season_id, division_id: event_id)
		 value.present? ? value.weight : nil
	end

	


end
