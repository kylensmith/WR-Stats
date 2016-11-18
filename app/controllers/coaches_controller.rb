class CoachesController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show

 @coach = Coach.find(params[:id])
  @ds = @coach.dual_seasons.sort { |a, b| b.season_id <=> a.season_id }
  @indy = @coach.team_scores.sort { |a, b| b.season_id <=> a.season_id }
  @title = "Coach: #{@coach.try(:name)}"
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
