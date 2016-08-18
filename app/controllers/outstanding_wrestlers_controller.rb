class OutstandingWrestlersController < ApplicationController
  def index
  	@OW_list = OutstandingWrestler.OW_data

  end

  def create
  end
end
