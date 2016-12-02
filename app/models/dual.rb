class Dual < ActiveRecord::Base
	include ActiveModel::Validations
	validates_presence_of :team1
	attr_accessor :dual_result, :month, :day, :hour, :minute
	# accepts_nested_attributes_for :team2
	# :date
	belongs_to :season, :foreign_key => "season_id"
	belongs_to :wrestler
	# has_many :team1, foreign_key: :id, class_name: 'School'
	# has_many :team2, foreign_key: :id, class_name: 'School'

	# belongs_to :team1, class_name: 'School'
	# belongs_to :team2, class_name: 'School'
	belongs_to :team2, class_name: "School"
	belongs_to :team1, class_name: "School"
	belongs_to :w, class_name: "School"
	# , :foreign_key => "w"
	belongs_to :l, class_name: "School"
	# , :foreign_key => "l"

	def opp(input)
		if input == team1
			team2
		
		elsif input == team2
			team1
		else
			false
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
		if w || t
			if input == team1
				score = " #{sprintf("%g", team1_score)}-#{sprintf("%g", team2_score)}" 
			elsif input == team2
				score = " #{sprintf("%g", team2_score)}-#{sprintf("%g", team1_score)}" 
			end
			if t
				score = "T #{score}"
			elsif w.id == input.id
				# w
				score = "W #{score}"
			elsif l.id == input.id
				score = "L #{score}"
				# l
			end
		end
	end
# try(:time).strftime.try("%I:%M%p")}
	def clean_time
		if time?
			self.time.strftime("%I:%M %p")
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

	def this_date
		if date?
			# @vacationrequest.try(:request_date).try(:strftime, '%B %e, %Y') 
			"#{date.try(:strftime, '%A')}-#{date.try(:day).try(:ordinalize)}"
		end
	end

	def form_date(input)
		
		p "******** Okay, it called. #{input.inspect}"
	
		

	end


end
