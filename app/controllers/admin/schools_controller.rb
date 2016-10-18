module Admin
  class SchoolsController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  before_filter :is_admin?
  def new
  end

  def create
  end

  def edit
  end

  def index
    @schools = School.all.order(:name)
     


  end

  def status
    @schools = School.all.order(:name)
    p "**************" 
    p "**************" 
    p "**************" 
    p "**************" 
    p "**************"

  end

  def changes
    @school = School.find(params[:school_id])
    p @school.active
    p "%%%%%%%%%%%"
    @school.toggle(:active)
    @school.save
    respond_to do |format|
      format.html { redirect_to admin_schools_status_path}
      format.js
    end
    p "**************"
    p"You have reached the action!"
    p @school.active
    p "**************"    
  end

end
end
