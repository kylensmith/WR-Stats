class SchoolsController < ApplicationController
  include ApplicationHelper
  def new
  end

  def create
  end

  def edit
  end

  def index
    @schools = School.all.order(:name)

  end

  def show
  	school_name =  params[:name].tr('_', ' ').tr('.','%')
    p school_name
    p "********************" 
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @ds = @team.dual_seasons.sort { |a,b| b.season_id <=> a.season_id || (b && 1) || -1 }
    @indy = @team.team_scores.sort { |a,b| b.season_id <=> a.season_id || (b && 1) || -1 }

  AaPlaceWinner.group(:season_id).count

    @all_americans = @team.all_americans.order(:season_id, :weight)
    # @all_americans.map
    # .last.wrestler.name




    # p @team.aa_wrestlers.to_hash

    




  end
end
