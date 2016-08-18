class VirtualOW
	require 'my_utilities'
	#Note: this is a virtual class used simply for methods.  It will not be a part of Active Record.
	attr_accessor :name, :wrestler_id, :school, :school_id, :location, :season, :division, :weight

	def initialize(athlete, wrestler_id, school, school_id, season, division, weight)

		self.name = athlete
		self.wrestler_id =wrestler_id
		self.school = school
		self.school_id = school_id
		self.season = season
		self.location = location
		self.division = division
		self.weight = weight

	end
end