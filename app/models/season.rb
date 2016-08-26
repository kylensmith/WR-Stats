class Season < ActiveRecord::Base
	
	# set_primary_key
	self.primary_key= 'year'
	# self.primary_key = 'sku'
	# def self.primary_key
	# 	'year_' + super
	# end
	
	has_many :wrestler_schools
	has_many :wrestlers, through: :wrestler_schools

	has_many :wrestler_schools
	has_many :schools, through: :wrestler_schools

	has_many :all_americans
	has_many :aa_wrestlers, through: :all_americans, source: :wrestler
	has_many :aa_place_winners
	has_many :bouts
	has_many :events

# Note: The select option adds a datacall to the join table to return the value
	has_many :ows, -> { select("wrestlers.*, outstanding_wrestlers.division_id AS division_id") }, through: :outstanding_wrestlers, source: :wrestler
	# && select("wrestlers.*, outstanding_wrestlers.season AS season")


	# has_many :ows, -> { includes (:season) }, through: :outstanding_wrestlers, source: :wrestler
	
	has_many :outstanding_wrestlers

	# has_many :readers, -> { select("readers.*, book_loans.book_loan_librarian AS book_loan_librarian") },
 #            :through => :book_loans

 	def dual_meets
 		DualMeet.where(season: self.id)
 		# InfoItem.where(work‌​_order: self.work_order).plu‌​ck(:maturity)
 	end

	def season_division
		self.includes(:outstanding_wrestlers).find(self)
	end

	def self.division
		Division.find(division_id)
	end

end


