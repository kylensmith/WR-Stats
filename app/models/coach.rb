class Coach < ActiveRecord::Base
	
	validates_presence_of :fname, :lname
	has_many :dual_seasons
	has_many :team_scores

# Used for full-text search on postgres
	include PgSearch
	multisearchable :against => [:name]
	# :using => {
 #                    :tsearch => {:dictionary => "english", :prefix => true, :any_word => true}
 #                  }
 #                  PgSearch.multisearch_options = { :using => { :tsearch => {:prefix => true, :dictionary => "english"} } }

	def self.rebuild_pg_search_documents
    find_each { |record| record.update_pg_search_document }
  end


# Comment out sunspot
	# searchable do 
		# text :name 
	# end



	def self.init_name
		if self.nil
			fname[1]
		end
	end

	def to_param
		"#{id} #{fname} #{lname}".parameterize
	end
	
end
