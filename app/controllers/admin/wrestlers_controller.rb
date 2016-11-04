module Admin
  class WrestlersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  before_filter :is_admin?
  def new
    @wrestler = Wrestler.new
  end

  def create
    @lname = params[:wrestler]["lname"]
    @fname = params[:wrestler]["fname"]
    if @lname.present? && @fname.present? 
      @name = "#{@lname}, #{@fname}"
      @wrestler = Wrestler.create(name: @name)
      @wrestler.update(wrestler_info)
      @wrestler.save 
      flash.notice = 'Wrestler: "' + @name + '" has been saved.'
    else  
      flash.alert = 'Wrestler NOT saved.'
    end
    redirect_to (:back)
  end

  def edit
    
  end

  def update
  
  end

  def index
    
  end






private 

  def wrestler_info
    params.require(:wrestler).permit(:high_school, :state_id)
  end

end
end
