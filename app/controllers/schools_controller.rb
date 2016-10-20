class SchoolsController < ApplicationController
  include ApplicationHelper

  def index
    @schools = School.all.order(:name)

  end

  def show
  	school_name =  params[:name].tr('_', ' ').tr('.','%')
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @ds = @team.dual_seasons.sort { |a,b| b.season_id <=> a.season_id || (b && 1) || -1 }
    @indy = @team.team_scores.sort { |a,b| b.season_id <=> a.season_id || (b && 1) || -1 }
    @all_americans = @team.all_americans.order(:season_id, :weight)
   
  end

end
