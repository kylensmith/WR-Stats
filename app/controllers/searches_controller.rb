class SearchesController < ApplicationController
  def index
    @search_key = params[:search]
  	@search = Sunspot.search [School, Coach, Event, Wrestler] do
      order_by(:score)
      # Checks length to drop last letter because some searches are not returning with full string
      fulltext "#{params[:search].length>3 ? params[:search].chop : params[:search]}*"
      paginate :per_page => 200
  	end
  	@return = @search.results
  end

  def new
  end

  def show
  	@search = Wrestler.search do 
  		fulltext params[:search]
  	end

  end
end
