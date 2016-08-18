class TeamRanking < ActiveRecord::Base
	belongs_to :team_ranking_release
	has_one :school
end
