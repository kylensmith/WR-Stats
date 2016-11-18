class SchedulesController < ApplicationController
  def index
    @title = "WRStats: Home"
  	@user = current_user
    @date = Time.now.to_date
    # @date = @date - 3887
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
    @ds = DualSeason.find_by(season_id: params[:id], school_id: @team)
    @season = Season.find(params[:id])
    @alldual = @team.all_duals
    # This will sort while also accepting nil values
    @duals = @alldual.select {|x| x['season_id'] == @season.year }
    @duals.sort! { |a,b| a.date <=> b.date || (b.date && 1) || -1 }
    @title = "#{@season.id} #{@team.name} Schedule"
   

  end

end
