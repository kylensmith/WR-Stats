class School < ActiveRecord::Base
	has_many :wrestlers, through: :wrestler_schools
	has_many :wrestler_schools
	
	has_many :championship_seasons, through: :wrestler_schools, source: :season

	has_many :all_americans
	has_many :aa_wrestlers, -> { select("wrestlers.*, all_americans.season_id AS season_id") }, through: :all_americans, source: :wrestler

	has_many :aa_place_winners
	has_many :aa_place_wrestlers, through: :aa_place_winners, source: :wrestler
	has_many :seasons
	has_many :outstanding_wrestlers
	has_many :ow_wrestlers, through: :outstanding_wrestlers, source: :wrestler

	has_many :dual_seasons
	has_many :duals

	has_many :team1, foreign_key: :team1_id, class_name: 'Dual'
	has_many :team2, foreign_key: :team2_id, class_name: 'Dual'

	has_many :team_scores

	has_many :dual_meets
	# belongs_to :team_ranking
	belongs_to :state

	has_many :season_duals, -> { select("duals.*, dual_seasons.division_id AS division_id") }, through: :dual_seasons, source: :dual
	
	# def aa_count
	# 	all_americans.where(school: dual.season_id).count

	# end


	def to_param
		name.tr(' ', '_') 
	end

	# def all_duals
	# 	arr = []
	# 	arr.push(Dual.where(opponent_id: self.id))
	# 	arr.push(Dual.where(school_id: self.id))
	# end
	def all_duals
		team1 + team2
	end



	



end


