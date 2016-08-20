class TeamRanking < ActiveRecord::Base
	belongs_to :team_ranking_release, foreign_key: 'team_ranking_release_id'
	belongs_to :school, foreign_key: 'school_id'
	belongs_to :season
	# has_many :schools, through: :team_ranking_release
end
