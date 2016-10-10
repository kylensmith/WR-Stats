class SchedulesController < ApplicationController
  def index
  	@user = current_user
    @date = Time.now.to_date
    @date = @date
    @ydate = @date - 1
    @tdate = @date + 1
    @yduals = Dual.where(date: @ydate)
    @duals = Dual.where(date: @date)
    @tduals = Dual.where(date: @tdate)
    # flash.notice = 
    # flash.alert = 
  end

  def show
  	school_name =  params[:school_name].tr('_', ' ') 
    @team = School.where{ name =~ school_name }
    @team = @team[0]
    @ds = DualSeason.find_by(season_id: params[:id], school_id: @team)
    @season = Season.find(params[:id])
    @alldual = @team.all_duals
    p "%%%%%%%%%%%%%%%%%%%%%"
    p @ds.inspect
    p "%%%%%%%%%%%%%%%%%%%%%"
    # This will sort while also accepting nil values
    @duals = @alldual.select {|x| x['season_id'] == @season.year }.sort { |a,b| a <=> b || (b && 1) || -1 }
    # .sort { |a, b| a.date <=> b.date }

   

  end

end
