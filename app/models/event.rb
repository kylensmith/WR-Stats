class Event < ActiveRecord::Base
	belongs_to :year
	has_many :schools, through: :team_scores
	belongs_to :division
	has_one :outstandingwrestler
	has_one :ow_wrestler, through: :outstandingwrestler, source: :wrestler
	has_one :ow_school, through: :outstandingwrestler, source: :school
	# need to do a migration to show team_champions
	# need to change attribute to team_champions_id
	# belongs_to :team_champion, class_name: "School"

	has_many :team_scores
	has_many :all_americans

	# Used for full-text search on postgres
	include PgSearch
	multisearchable :against => [:name, :season_id]
	# :using => {
 #                    :tsearch => {:dictionary => "english", :prefix => true, :any_word => true}
 #                  }

	def self.rebuild_pg_search_documents
    	find_each { |record| record.update_pg_search_document }
  	end

# comment out sunspot
	# searchable do 
	# 	text :name
	# 	text :season_id
	# end

	def to_param
		"#{id} #{season_id} #{name}".parameterize
	end


	 # could connect to outstandingwrestlers


end
