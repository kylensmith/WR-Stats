class SchedulesController < ApplicationController
  def index
  	@user = current_user
  end

  def show
  	school_name =  params[:school_name].tr('_', ' ') 
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @season = Season.find(params[:id])

    
  end

end
