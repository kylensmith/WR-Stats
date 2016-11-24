class DualSeason < ActiveRecord::Base
	validates_uniqueness_of :season_id, :scope => :school_id
	validates_presence_of :season, :school
	belongs_to :school
	belongs_to :coach
	belongs_to :season, :foreign_key => "season_id"
	has_many :teams
	belongs_to :division
	# has_many :matches, source :duals



# Method that returns the team's ranking, if they were ranked in the final dual ranking of the season.
	def rank_it
		# @tr = TeamRankingRelease.reject { |x|  x.nwca == false }
		if self.season_id <= 1973
			@trr = TeamRankingRelease.where(season_id: self.season_id).order(:date).last 
			else
			@trr = TeamRankingRelease.where(season_id: self.season_id, division_id: self.division_id).order(:date).last 
		end
		if @trr != nil
			@new_record = @trr.team_rankings.where(school_id: self.school_id)
			if @new_record.length > 0
				"##{@new_record[0].rank}"
			end
		else
		end
	end

	def poll
		TeamRankingRelease.where(season_id: self.season_id, division_id: self.division_id).order(:date).last 
	end

	def clean_record
		if ties && ties != 0
			"#{wins}-#{losses}-#{ties}"
		else
			"#{wins}-#{losses}"
		end
	end

	






end








