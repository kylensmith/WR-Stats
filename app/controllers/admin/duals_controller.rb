module Admin
	class DualsController < ApplicationController
  	before_filter :authenticate_user!
  	before_filter :is_admin?
	  def new
	  	@dual = Dual.new
	  end

	  def create
	  	@dual.create(dual_info)
	  	case params[:dual][:dual_result][0].to_i
	  	when 1
	  		if @dual.team1.present?
	  			@dual.w = @dual.team1.id
	  			@dual.l = @dual.team2.id
	  			@dual.t = false
	  		end
  		when 2
  			if @dual.team2.present?
	  			@dual.w = @dual.team2.id
	  			@dual.l = @dual.team1.id
	  			@dual.t = false
	  		end
  		when 3
	  		@dual.t = true
	  	end
	  	if @dual.save
	  		flash.notice = "Dual results updated."
	  	else
	  		flash.alert = "Error: Dual not updated"
	  	end 
	  	redirect_to edit_admin_dual_path(@dual)

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
	  	case params[:dual][:dual_result][0].to_i
	  	when 1
	  		if @dual.team1.present?
	  			@dual.w = @dual.team1.id
	  			@dual.l = @dual.team2.id
	  			@dual.t = false

	  		end
  		when 2
  			if @dual.team2.present?
	  			@dual.w = @dual.team2.id
	  			@dual.l = @dual.team1.id
	  			@dual.t = false
	  		end
  		when 3
	  		@dual.t = true
	  	end
	  	if @dual.save
	  		flash.notice = "Dual results updated."
	  	else
	  		flash.alert = "Error: Dual not updated"
	  	end 
	  	redirect_to edit_admin_dual_path(@dual)
	  end
	


	private 
	def dual_info
		params.require(:dual).permit(:season_id, :date, :time, :dual_result, :site, :team1_id, :team2_id, :team2_score, :tie_break, :w, :l, :t, :attendance, :complete, :estimated)
	end

end
end