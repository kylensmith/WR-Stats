class WrestlerSchool < ActiveRecord::Base
	
    belongs_to :wrestler
    belongs_to :school
	# belongs_to :school, foreign_key: "school_id"
    belongs_to :season, :foreign_key => "season"
    # , foreign_key: "year"

    # delegate :season, :to => :wrestler, prefix: true


	# def wrestler_name
 #    wrestler && wrestler.name
 #  end

 #  def school_name
 #    school && school.name
 #  end

end



