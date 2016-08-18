class DualSeason < ActiveRecord::Base
	belongs_to :school
	belongs_to :coach
	belongs_to :season, :foreign_key => "season"
	# has_many :matches, source :duals

	def self.season_duals
		Dual.where(season: self.season, team_id: self.school_id)
	end
end
