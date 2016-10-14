module Admin
	class DualsController < ApplicationController
  	before_filter :authenticate_user!
  	before_filter :is_admin?
	  def show
	  end

	  def edit
		  	@dual = Dual.find(params[:id])
		  	@seasons = Season.all.sort { |a, b| b.id <=> a.id }
		  	# @schools = School.all.sort { |a,b| a <=> b || (b && 1) || -1 }
	  	# else
	  	# 	redirect root_path
	  	# end
	  end

	  def index
	  end

	  def update
	  	@dual = Dual.find(params[:id])
	  	@dual.update(dual_info)
	  	@dual.save
	  	redirect_to edit_admin_dual_path(@dual)
	  end
	


	private 
	def dual_info
		params.require(:dual).permit(:season_id, :date, :time, :site, :team1_id, :team2_id, :team1_score, :team2_score, :tie_break, :w, :l, :t, :attendance, :complete, :estimated)
	end
end
end