class SchoolsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def index
  end

  def show
  	@team = School.find_by(name: params[:name])
  end
end
