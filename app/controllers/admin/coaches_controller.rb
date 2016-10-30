module Admin
	class CoachesController < ApplicationController
  

  def index
  	@coaches = Coach.all.order("LOWER(lname)")
  end

  def show

 	@coach = Coach.find(params[:id])
  	@ds = @coach.dual_seasons.sort { |a, b| b.season_id <=> a.season_id }
  	@indy = @coach.team_scores.sort { |a, b| b.season_id <=> a.season_id }

  end

  def change_status
    @coach = Coach.find(params[:coach_id])
    @val = params[:val]
    @coach.toggle(:active)
    @coach.save
    respond_to do |format|
      format.html { redirect_to admin_coaches_path}
      format.js
    end

  end

  def new
    @coach = Coach.new

  end

  def create
    if @coach = Coach.create(coach_info) 
      @name = "#{params[:coach]['lname']}, #{params[:coach]['fname']}"
      if @coach.update(name: @name)
        @coach.save
        flash.notice = "Coach added to database."
      end
    else 
      flash.warning = "Record was not created."
    end
    redirect_to new_admin_coach_path

  end
  	

private 

  def coach_info
    params.require(:coach).permit(:fname, :active, :lname)
  end



end
end
