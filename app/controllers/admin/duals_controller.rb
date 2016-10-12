module Admin
	class DualsController < ApplicationController
	  def show
	  end

	  def edit
	  	@dual = Dual.find(params[:id])
	  	@seasons = Season.all.sort { |a, b| b.id <=> a.id }
	  	@schools = School.all
	  end

	  def index
	  end
	end
end