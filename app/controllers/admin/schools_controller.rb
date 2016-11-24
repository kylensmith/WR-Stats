module Admin
  class SchoolsController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  before_filter :is_admin?
  def new
    @school = School.new
    @title = "Admin: New School"
  end

  def create
    @school = School.create(school_info)
    @school.save
    redirect_to admin_schools_status_path
  end

  def edit
    school_name =  params[:name].tr('_', ' ').tr('.','%')
    @team = School.where{ name =~ school_name }
    @school = @team[0]
    @title = "Admin: Edit #{@school.try(:name)}"
  end

  def update
     school_name =  params[:name].tr('_', ' ').tr('.','%')
    @team = School.where{ name =~ school_name }
    @school = @team[0]
    @school.update(school_info)
    if !@school.save
      flash.warning = "School info did not update.  Please try again."
    end
      redirect_to admin_schools_status_path



  end

  def index
    @schools = School.all.order(:name)
     


  end

  def status
    @schools = School.all.order(:name)
  end

  def changes
    @school = School.find(params[:school_id])
    @val = params[:val]
    @school.toggle(:active)
    @school.save
    respond_to do |format|
      format.html { redirect_to admin_schools_status_path}
      format.js
    end
  end

  def new_dual_season
    @schools = School.all.where(active: true).order(:name)
  end

  def create_dual_season
  end

    def dual_create
      p "reached mass create *************"
      p params
      p "**************"
   
   end



private 

  def school_info
    params.require(:school).permit(:name, :city, :state_id, :current_division)
  end

end
end
