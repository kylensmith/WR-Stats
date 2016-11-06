class Event < ActiveRecord::Base
	belongs_to :year
	has_many :schools, through: :team_scores
	belongs_to :division
	has_one :outstandingwrestler
	has_one :ow_wrestler, through: :outstandingwrestler, source: :wrestler
	has_one :ow_school, through: :outstandingwrestler, source: :school

	has_many :team_scores
	has_many :all_americans

# comment out sunspot
	# searchable do 
	# 	text :name
	# 	text :season_id
	# end

	def to_param
		"#{id} #{season_id} #{name}".parameterize
	end


	 # could connect to outstandingwrestlers


end
