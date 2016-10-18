class Coach < ActiveRecord::Base
	has_many :dual_seasons
	has_many :team_scores


	searchable do 
		text :name 
	end

	def self.init_name
		if self.nil
			fname[1]
		end
		# [0] + ". " + lname
		
	end
	
end
