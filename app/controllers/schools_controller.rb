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
  	school_name =  params[:name].tr('_', ' ') 
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @ds = @team.dual_seasons.sort { |a, b| b.season_id <=> a.season_id }
    @indy = @team.team_scores.sort { |a, b| b.season_id <=> a.season_id }


AaPlaceWinner.group(:season_id).count
# how to sort^^

    @all_americans = @team.all_americans.order(:season_id, :weight)
    # @all_americans.map
    # .last.wrestler.name

p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p @thiser = @team.aa_wrestlers.first.inspect
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"
    p "*******************************"


    # p @team.aa_wrestlers.to_hash

    




  end
end
