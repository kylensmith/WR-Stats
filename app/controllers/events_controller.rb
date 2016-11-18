class EventsController < ApplicationController
  

  def show
  	@event = Event.find(params[:id])
  	@placers = @event.all_americans.group_by{|e| e.weight}
  	@title = "#{@event.try(:season_id)} #{@event.try(:name)}"
  end

  def index
  end

  
end
