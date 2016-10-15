class Dual < ActiveRecord::Base
	attr_accessor :dual_result
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
# try(:time).strftime.try("%I:%M%p")}
	def clean_time
		if time?
			self.time.strftime("%I:%M%p")
		else
		end
	end

	# sprintf('%g', dual.try(:team1_score))
	def check_score1
		if team1_score?
		" (#{sprintf('%g', self.team1_score)})" 
		else
		end
	end

	def check_score2
		if team2_score?
		" (#{sprintf('%g', self.team2_score)})" 
		else
		end
	end

	def tb
		if tie_break
			"TB"
		end
	end


end
