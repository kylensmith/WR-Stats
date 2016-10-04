class EventsController < ApplicationController
  def new
  end

  def show
  	@event = Event.find(params[:id])
  end

  def index
  end

  def edit
  end
end
