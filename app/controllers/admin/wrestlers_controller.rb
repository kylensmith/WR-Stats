module Admin
  class WrestlersController < ApplicationController
  include ApplicationHelper
  before_filter :authenticate_user!
  before_filter :is_admin?
  def new
    @wrestler = Wrestler.new
  end

  def create
    
  end

  def edit
    
  end

  def update
  
  end

  def index
    
  end






private 

  def school_info
    params.require(:wrestler).permit(:name, :city, :state_id, :current_division)
  end

end
end
