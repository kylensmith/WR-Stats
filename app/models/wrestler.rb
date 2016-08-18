class Wrestler < ActiveRecord::Base
	attr_accessor :divison, :season
	# has_many :wrestler_schools
	has_many :seasons, through: :wrestler_schools, source: :season, primary_key: "year", foreign_key: "season_id"
	has_many :schools, through: :wrestler_schools, source: :school
	has_many :wrestler_schools
	belongs_to :school

	has_many :aa_place_winners
	has_many :outstanding_wrestlers



	has_many :wrestler_schools
	has_many :championship_schools, through: :wrestler_schools, source: :school


	has_many :all_americans
	has_many :aa_schools, through: :all_americans, source: :school

	has_many :contestants
	


	has_many :won, foreign_key: :winner_id, class_name: 'Bout'
	has_many :lost, foreign_key: :loser_id, class_name: 'Bout'
	




	# has_many :matches_a, foreign_key: :first_competitor_id, class_name: 'Match'

	
	# def division
	# 	Division.find(division_id)
	# end
	


	def all_matches
		won + lost
	end

	def season_division
		self.includes(:outstanding_wrestlers).find(self)
	end

	





	# Returns an array of all of the years in which the wrestler earned All-American honors
	def aa_years
		array = []
		all_americans.includes(:school).each do |honor|
			array.push(honor.season)
		end
		return array
	end

	#returns iterations of the jointable which may have the season attribute called to show the year of the National Qualifier honor.
	def nq_years
		schools.select('schools.*, wrestler_schools.season_id').each do |it|
			it
		end
	end

	def schools
  		self.year.map(&:season)
	end

	def ow_event
		return season
		# Division.find(division_id)
	end



	# Counts the number of All-American honors
	def aa_count
		wrestler_schools.includes(:school).count

	end

	def ow_count
		outstanding_wrestlers.includes(:wrestler).count

	end

	def natq
		wrestler_schools.each do |this|
			this.season_id
		end
	end

	def nat_year
		seasons.select('seasons.*, wrestler_schools.season_id').each do |it|
			it
		end
	end

	def nat_years
		divisions.select('divisions.*, outstanding_wrestlers').each do |it|
			it
		end
	end



end






	



