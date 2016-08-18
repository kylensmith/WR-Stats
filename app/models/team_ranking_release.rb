class TeamRankingRelease < ActiveRecord::Base
	has_many :team_rankings
	has_many :schools, through: :team_rankings
end
