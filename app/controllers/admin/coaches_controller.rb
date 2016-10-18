module Admin
	class CoachesController < ApplicationController
  

  def index
  end

  def show

 @coach = Coach.find(params[:id])
  @ds = @coach.dual_seasons.sort { |a, b| b.season_id <=> a.season_id }
  @indy = @coach.team_scores.sort { |a, b| b.season_id <=> a.season_id }

  end


end
end
