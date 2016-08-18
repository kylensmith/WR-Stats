class Dual < ActiveRecord::Base
	belongs_to :season, :foreign_key => "season"
	belongs_to :wrestler
end
