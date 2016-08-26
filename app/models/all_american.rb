class AllAmerican < ActiveRecord::Base
	belongs_to :wrestler
	belongs_to :school
	belongs_to :season, :foreign_key => "season"

	# delegate :season, :to => :school, prefix: true

	# def wrestler_name
 #    wrestler && wrestler.name
 #  end

 #  def school_name
 #    school && school.name
 #  end
 def self.sort_data
		# p "FAILLLLLLLLLLLLL"
		diff = []
		self.all.each do |iter|
			# obj = AaPlaceWinner.new(wrestler_id: iter.wrestler_id, division_id: iter.division_id, school_id: iter.school_id, season_id: iter.season_id, weight: iter.weight, place: iter.place) 
			arr = AaPlaceWinner.where(wrestler_id: iter.wrestler_id, division_id: iter.division_id, school_id: iter.school_id, season_id: iter.season_id, weight: iter.weight, place: iter.place) 
			if arr.empty? 
				# p "FAILLLLLLLLLLLLL"
				diff.push(iter)
			end 
		end
		diff.each do |record|
			AaPlaceWinner.create(wrestler_id: record.wrestler_id, division_id: record.division_id, school_id: record.school_id, season_id: record.season_id, weight: record.weight, place: record.place) 
			
		end
	end


end
