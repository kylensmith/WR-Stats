class WrestlersController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def index
  end

  def show
  	@wrestler = Wrestler.find(params[:id])
  	@place = @wrestler.aa_place_winners.sort { |a,b| b.season_id <=> a.season_id || (b && 1) || -1 }
  	# @alldual.select {|x| x['season_id'] == [1,2,3,4,5,6,7,8] }.sort { |a,b| a <=> b || (b && 1) || -1 }



  p "***************************"
  p "***************************"
  p @place.inspect
  p "***************************"
  p "***************************"

  end
end
