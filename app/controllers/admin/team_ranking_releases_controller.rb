module Admin
  class TeamRankingReleasesController < ApplicationController
    include ApplicationHelper
    before_filter :authenticate_user!
    before_filter :is_admin?
    def new
      @ranking = TeamRankingRelease.new
      30.times do 
        @ranking.team_rankings.build
      end
    end

    def create
      @ranking = TeamRankingRelease.new(ranking_info)
      # Make sure there are teams to rank
      if @ranking.team_rankings.count > 1
        if @ranking.date.mon < 7
          @ranking.season_id = @ranking.date.year
        else @ranking.date.mon >= 7
          @ranking.season_id = (@ranking.date.year+1)
        end
        @ranking.teams_ranked = @ranking.team_rankings.count
        @ranking.save
        flash[:notice] = "You've saved a poll to the database."
        redirect_to poll_path(@ranking)
      else        
        flash[:alert] = "Your ranking was not saved.  Please ensure all the information is complete."
        redirect_to (:back)
      end
    end

    def edit
      @ranking = TeamRankingRelease.find(params[:id])
      @ranked_teams = @ranking.team_rankings.order(:rank)
    end

    def index
    end

    def show
     @poll = TeamRankingRelease.find(params[:id])
     @title = "Dual Ranking Poll"
     @rank_array = @poll.team_rankings.order(:rank)
   end

   private
   def ranking_info
    params.require(:team_ranking_release).permit(:date, :poll_name, :nwca, :dual_ranking, :division_id, team_rankings_attributes: [ :id, :rank, :school_id ])
   end
 end
end
