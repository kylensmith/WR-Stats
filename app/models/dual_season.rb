class DualSeason < ActiveRecord::Base
	belongs_to :school
	belongs_to :coach
	belongs_to :season, :foreign_key => "season"
	# has_many :matches, source :duals



# Method that returns the team's ranking, if they were ranked in the final dual ranking of the season.
	def rank_it
		@trr = TeamRankingRelease.where(season_id: self.season_id).order(:date).last 
		if @trr != nil
			@new_record = @trr.team_rankings.where(school_id: self.school_id)
			if @new_record.length > 0
				@new_record[0].rank
			end
		else
		end
	end

	def poll
		TeamRankingRelease.where(season_id: self.season_id).order(:date).last 
	end






end








