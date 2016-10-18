class Division < ActiveRecord::Base
	require 'my_utilities'
	has_many :seasons
	has_many :wrestlers
	has_many :schools, :foreign_key => "current_division"
	has_many :outstanding_wrestlers
	has_many :events
	has_many :team_scores

end
