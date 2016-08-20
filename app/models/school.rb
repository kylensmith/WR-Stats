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

	has_many :dual_meets
	# belongs_to :team_ranking

	has_many :season_duals, -> { select("duals.*, dual_seasons.division_id AS division_id") }, through: :dual_seasons, source: :dual
	

end


