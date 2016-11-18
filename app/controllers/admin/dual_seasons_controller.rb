module Admin
  class DualSeasonsController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  before_filter :is_admin?
  
  def new
    @title = "Admin: New Dual Season"
    @schools = School.all.where(active: true).order(:name)
    @ds = DualSeason.new
    @coaches = Coach.all
    @div = Division.all
  end

  def new_all_active
    @ds = DualSeason.new
  end

  def create
    @ds = DualSeason.new(ds_info)
    if @ds.save
      flash.notice = "The dual season has been created."
    else 
      flash.alert = "Failure.  The dual season for was not created.  Please try again with all required fields."
    end
    redirect_to(:back)
  end

  def create_all_active
    @yr = params[:dual_season]["season_id"].to_i
    @pass = []
    @fail = []
      if @yr.present? 
        @prev_yr = @yr-1
      @schools = School.where(active: true)
      @schools.each do |school|
        @prev_ds = DualSeason.find_by(school_id: school.id, season_id: (@yr-1))
        @new_ds = DualSeason.create(school_id: school.id, season_id: @yr)
        if @new_ds.save
          @pass.push(school)
        else
          @fail.push(school)
        end
        if @prev_ds && @new_ds
          if @prev_ds.school.current_division
            @new_ds.update(division_id: @prev_ds.school.current_division)
          end 
          if @prev_ds.coach
            @new_ds.update(coach_id: @prev_ds.coach.id)
          end
        end        
      end
      flash.notice = "You have successfully Completed the process of creating a new dual season."
      flash.notice = "Note: #{@pass.count} new records were created for this season. #{@fail.count} schools already had records for this season.  "
      redirect_to (:back)
    else
      flash.alert = "You must select a year."
      redirect_to (:back)
    end
    

  end

  def edit
    @title = "Admin: Edit Dual Season"
    @ds = DualSeason.find(params[:id])
  end

  def update
    @ds = DualSeason.find(params[:id])
    @ds.update(ds_info)
    if @ds.save
      flash.notice = "The dual season has been updated."
    else 
      flash.alert = "Failure.  The dual season for was not created.  Please try again with all required fields."
    end
    redirect_to(:back)
  end

  def index
  end

 


private 

  def ds_info
    params.require(:dual_season).permit(:school_id, :coach_id, :season_id, :division_id)
  end

end
end
