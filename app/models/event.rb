class Event < ActiveRecord::Base
	belongs_to :year
	has_many :schools
	belongs_to :division
	has_one :outstandingwrestler
	has_one :ow_wrestler, through: :outstandingwrestler, source: :wrestler
	has_one :ow_school, through: :outstandingwrestler, source: :school


	 # could connect to outstandingwrestlers


end
