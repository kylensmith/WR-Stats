class Dual < ActiveRecord::Base
	belongs_to :season, :foreign_key => "season"
	belongs_to :wrestler
	# has_many :team1, foreign_key: :id, class_name: 'School'
	# has_many :team2, foreign_key: :id, class_name: 'School'

	# belongs_to :team1, class_name: 'School'
	# belongs_to :team2, class_name: 'School'
	belongs_to :team2, class_name: "School"
	belongs_to :team1, class_name: "School"
end
