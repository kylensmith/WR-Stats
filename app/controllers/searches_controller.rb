class SearchesController < ApplicationController

# commented out to disable sunspot search

  # def index
  #   @search_key = params[:search]
  # 	@search = Sunspot.search [School, Coach, Event, Wrestler] do
  #     order_by(:score)
  #     # Checks length to drop last letter because some searches are not returning with full string
  #     fulltext "#{params[:search].length>3 ? params[:search].chop : params[:search]}*"
  #     paginate :per_page => 200
  # 	end
  # 	@return = @search.results
  #   if @return.length == 1
  #     redirect_to polymorphic_path(@return.first)
  #   end
  # end

  # def new
  # end

  # def show
  # 	@search = Wrestler.search do 
  # 		fulltext params[:search]
  # 	end

  # end

  def index
    @search_key = params[:search]
    @return = PgSearch.multisearch(@search_key)
    if @return.length == 1
       redirect_to polymorphic_path(@return.first.searchable)
     end
  end


end
