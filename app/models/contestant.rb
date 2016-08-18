class Contestant < ActiveRecord::Base
	belongs_to :wrestler
	
# One way connection to wrestler.  Inverse relationship isn't traversing.
	# Not sure what events contestants competed in...



end
