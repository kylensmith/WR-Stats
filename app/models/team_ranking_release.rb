class TeamRankingRelease < ActiveRecord::Base
	has_many :team_rankings
	# , foreign_key: :team_ranking_release_id
	has_many :schools, through: :team_rankings
end
