class TeamRankingReleasesController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def index
  end

  def show
  	@poll = TeamRankingRelease.find(params[:id])
  	@rank_array = @poll.team_rankings.order(:rank)
  end
end
