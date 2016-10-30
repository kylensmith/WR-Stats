class TeamScore < ActiveRecord::Base
	belongs_to :coach
	belongs_to :season
	belongs_to :school
	belongs_to :event
	belongs_to :division

	def standing
		# place
		case self.place
			
		when 1
			"Champions"
		when 2
			"Runner-up"
		when 3 .. 4
			"Placed"
		when 5 .. 10
			"Top-10"
		when 11 .. 20
			"Top-20"
		else
		end
	end

	def team_aa
		self.event.all_americans.where(school_id: self.school_id) 
	end

end
