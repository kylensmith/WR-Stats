class Coach < ActiveRecord::Base
	validates_presence_of :fname, :lname
	has_many :dual_seasons
	has_many :team_scores

# Comment out sunspot
	# searchable do 
		# text :name 
	# end

	def self.init_name
		if self.nil
			fname[1]
		end
	end

	def to_param
		"#{id} #{fname} #{lname}".parameterize
	end
	
end
