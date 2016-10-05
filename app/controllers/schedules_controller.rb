class SchedulesController < ApplicationController
  def index
  	@user = current_user
    @date = Time.now.to_date
    @date = @date - 3882
    @ydate = @date - 1
    @tdate = @date + 1
    @yduals = Dual.where(date: @ydate)
    @duals = Dual.where(date: @date)
    @tduals = Dual.where(date: @tdate)

  end

  def show
  	school_name =  params[:school_name].tr('_', ' ') 
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @season = Season.find(params[:id])
    @alldual = @team.all_duals
    @duals = @alldual.select {|x| x['season_id'] == @season.year }.sort { |a, b| a.date <=> b.date }

    # @ds = @DualSeason.find_by(season_id: @season.year, ) 


  end

end
