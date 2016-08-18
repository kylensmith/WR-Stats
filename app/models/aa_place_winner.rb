class AaPlaceWinner < ActiveRecord::Base
	# attr_accessor :weight
	belongs_to :wrestler
	belongs_to :school
	belongs_to :season, :foreign_key => "season"

	# Using this to find discrepencies in the AaPlaceWinner and AllAmerican tables.
	def self.sort_data
		# p "FAILLLLLLLLLLLLL"
		champ = [1, 2, 3, 7, 8, 10, 13]
		diff = []
		self.all.each do |iter|
			p "FAILLLLLLLLLLLLL" 
			# obj = AaPlaceWinner.new(wrestler_id: iter.wrestler_id, division_id: iter.division_id, school_id: iter.school_id, season_id: iter.season_id, weight: iter.weight, place: iter.place) 
			arr = AllAmerican.where(wrestler_id: iter.wrestler_id, division_id: iter.division_id, school_id: iter.school_id, season: iter.season_id, weight: iter.weight, place: iter.place) 
			if arr.empty? 
				# p "FAILLLLLLLLLLLLL"
				diff.push(iter)
			end 
		end
		diff.each do |record|
			if champ.include?(record.division_id)
				AllAmerican.create(wrestler_id: record.wrestler_id, division_id: record.division_id, school_id: record.school_id, season: record.season, weight: record.weight, place: record.place) 
			
			end
		end
	end

	
end
