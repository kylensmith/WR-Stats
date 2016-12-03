class TeamRankingRelease < ActiveRecord::Base
	has_many :team_rankings
	# , foreign_key: :team_ranking_release_id
		accepts_nested_attributes_for :team_rankings, :allow_destroy => true,:reject_if => :all_blank
	attr_accessor :team_ranking_attributes
	
	has_many :schools, through: :team_rankings
	belongs_to :division

end
