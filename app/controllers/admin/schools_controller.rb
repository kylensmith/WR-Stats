module Admin
  class SchoolsController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  before_filter :is_admin?
  def new
    @school = School.new
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
  end

  def update
     school_name =  params[:name].tr('_', ' ').tr('.','%')
    @team = School.where{ name =~ school_name }
    @school = @team[0]
    @school.update(school_info)
    p "************"
    p school_info.inspect
    p "*************"
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
    @school.toggle(:active)
    @school.save
    respond_to do |format|
      format.html { redirect_to admin_schools_status_path}
      format.js
    end
  end



private 

  def school_info
    params.require(:school).permit(:name, :city, :state_id, :current_division)
  end

end
end
