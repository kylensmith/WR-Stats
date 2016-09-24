class Dual < ActiveRecord::Base
	belongs_to :season, :foreign_key => "season"
	belongs_to :wrestler
	# has_many :team1, foreign_key: :id, class_name: 'School'
	# has_many :team2, foreign_key: :id, class_name: 'School'

	# belongs_to :team1, class_name: 'School'
	# belongs_to :team2, class_name: 'School'
	belongs_to :team2, class_name: "School"
	belongs_to :team1, class_name: "School"

	def opp(input)
		if input == team1
			team2
		else
			team1
		end
	end

	def location(input)
		if input == team1 
			if site == 1
				"(H)"
			elsif site == 2
				"(A)" 
			elsif site == 3
				"(N)"
			else
				# Blanks for location unknown
			end
		elsif input == team2 
			if site == 1
				"(A)"
			elsif site == 2
				"(H)"
			elsif site == 3
				"(N)"
			else
				# Blank for location unknown
			end
		end
	end

	def result(input)
		if input == team1
			score = " #{sprintf("%g", team1_score)}-#{sprintf("%g", team2_score)}" 
		elsif input == team2
			score = " #{sprintf("%g", team2_score)}-#{sprintf("%g", team1_score)}" 
		end
		if t
			score = "T #{score}"
		elsif w == input.id
			# w
			score = "W #{score}"
		elsif l == input.id
			score = "L #{score}"
			# l
		end

	end






end
