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
    @team1 = School.new
    @schedule = []
    @new_school = School.new

    @schools = School.alphabetically
    # @new_duals = @team.duals.new
    # .build

    3.times do

      @new_dual = Dual.new

    # @new_school.duals.build
   #   # = Dual.new
    @schedule.push(@new_dual)
   #  # @new_dual = @team.build_duals
   end

  end



end
