class DualsController < ApplicationController
  def show
  	
  end

  def edit
  end

  def index
  end

  def update
  	flash.notice = "Failure"
	  	
	  	redirect_to root_path
	  end
 
end
