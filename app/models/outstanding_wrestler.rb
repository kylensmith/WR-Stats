class OutstandingWrestler < ActiveRecord::Base
	require 'my_utilities'
	delegate :division, to: :season, prefix: true
	delegate :division, to: :wrestler, prefix: true
	delegate :division, to: :school, prefix: true
	# attr_accessor :wrester, :school, :season
	belongs_to :season, :foreign_key => "season"
	belongs_to :wrestler 
	belongs_to :school
	belongs_to :division



	# This method is called to give a complete list of all OWs of record and to pull in the coresponding information to render in the view.  
	# Returns an array that is sorted by the season.
	def self.OW_data
		@new_array = []
		self.all.each do |ow_loop|
			champ = ow_loop.season
			yr = champ.year ? champ.year : nil
			wre = ow_loop.wrestler
			div = ApplicationHelper.find_event(ow_loop.division, yr)
			div_id = ow_loop.division_id
			loc = champ.location
			sch = ow_loop.school.present? ? ow_loop.school.name : nil
			sch_id = ow_loop.school.present? ? ow_loop.school.id : nil
			puts ow_loop.wrestler_id
			weight = ApplicationHelper.find_weight(ow_loop.wrestler_id, champ.id, div_id)
			ow_info = VirtualOW.new(wre.name, wre.id, sch, sch_id, yr, div, weight)
			@new_array.push(ow_info)
		end
		p "********************************************************************************************************"
		p @new_array.count
		# Sort the array of athletes by season
		@new_array.sort! { |a,b| b.season <=> a.season }

	end




end
