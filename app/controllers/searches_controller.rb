class SearchesController < ApplicationController
  def index
    @search_key = params[:search]
  	@search = Sunspot.search [School, Wrestler, Coach, Event] do
      fulltext "#{params[:search].length>1 ? params[:search].chop : params[:search]}*"
      paginate :per_page => 200
      # any_of do
      # end
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
