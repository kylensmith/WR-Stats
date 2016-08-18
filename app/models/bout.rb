class Bout < ActiveRecord::Base
	# belongs_to :winner, class_name: 'Wrestler'
	# belongs_to :loser, class_name: 'Wrestler'
	# belongs_to :winner, :foreign_key => "wrestler_id", class_name: 'Wrestler'
	# belongs_to :loser, :foreign_key => "wrestler_id", class_name: 'Wrestler'
	belongs_to :winner, :class_name => 'Wrestler'
	belongs_to :loser, :class_name => 'Wrestler'
	belongs_to :season, :foreign_key => "season"

	# belongs_to :winning_wrestler_id, class_name: 'Wrestler'
	# belongs_to :losing_wrestler_id, class_name: 'Wrestler'

	# belongs_to :author, :class_name => "User"
 #    belongs_to :editor, :class_name => "User"




end
