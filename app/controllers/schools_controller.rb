class SchoolsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def index
  end

  def show
  	school_name =  params[:name].tr('_', ' ') 
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @ds = @team.dual_seasons.reverse
    
   

  end
end
