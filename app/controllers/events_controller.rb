class EventsController < ApplicationController
  

  def show
  	@event = Event.find(params[:id])
  	@placers = @event.all_americans.group_by{|e| e.weight}
  end

  def index
  end

  
end
