class Division < ActiveRecord::Base
	require 'my_utilities'
	has_many :seasons
	has_many :wrestlers
	has_many :schools
	has_many :outstanding_wrestlers
	has_many :events

end
