class DualMeet < ActiveRecord::Base
	belongs_to :season, :foreign_key => "season"
end
