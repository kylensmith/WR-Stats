module Admin
	class DualsController < ApplicationController
		include ApplicationHelper
		protect_from_forgery with: :null_session
		
		before_filter :authenticate_user!
		before_filter :is_admin?
		def new
			@dual = Dual.new
			@title = "Admin: New Dual"
		end

		def create
			p params.inspect
			@dual = Dual.new(dual_info)
			yr = params[:dual]["date(1i)"].to_i
			mon = params[:dual]["date(2i)"].to_i
			day = params[:dual]["date(3i)"].to_i
			@dual.date = DateTime.new(yr, mon, day)
			@season = check_season(mon, yr)
			@dual.season_id = @season
			@dual.save
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
			p @dual.save
			if @dual.save
				flash.notice = "Dual scheduled."
				redirect_to (:back)
			else
				flash.alert = "Error: Dual not created.  Please confirm all required fields are populated."
				redirect_to (:back)
			end 
	  	# redirect_to edit_admin_dual_path(@dual)

	  end

	  def edit
	  	@dual = Dual.find(params[:id])
	  	@seasons = Season.all.sort { |a, b| b.id <=> a.id }
		@title = "Admin: Edit Dual" 
		  	# @schools = School.all.sort { |a,b| a <=> b || (b && 1) || -1 }
	  	# else
	  	# 	redirect root_path
	  	# end
	  end

	  def index
	  end

	  def this_week
	  	# @duals = Dual.where(complete: nil)
	  	@title = "Admin: This Week's Duals."
	  	@duals = Dual.where(date: 4.days.ago..4.days.from_now).order(:date, :time)
	  	# current_user.tasks.where(due_date: 1.week.ago..Date.today)

	  end

	  def this_week_complete
	  end

	  def destroy
	  	@dual = Dual.find(params[:id])
	  	@dual.delete
	  	flash.notice = "The dual record has been deleted."
	  	redirect_to root_path
	  end


	  def update
	  	@dual = Dual.find(params[:id])
	  	yr = params[:dual]["date(1i)"].to_i
	  	mon = params[:dual]["date(2i)"].to_i
	  	day = params[:dual]["date(3i)"].to_i
	  	@dual.date = DateTime.new(yr, mon, day)
	  	@season = check_season(mon, yr)
	  	@dual.season_id = @season
	  	@dual.save
	  	case params[:dual][:dual_result][0].to_i
	  	when 1
	  		if @dual.team1.present?
	  			@dual.w = @dual.team1
	  			@dual.l = @dual.team2
	  			@dual.t = false
	  		end
	  	when 2
	  		if @dual.team2.present?
	  			@dual.w = @dual.team2
	  			@dual.l = @dual.team1
	  			@dual.t = false
	  		end
	  	when 3
	  		@dual.t = true
	  	end
	  	 @dual.update(dual_info)
	  	if @dual.save
	  		flash.notice = "Dual scheduled."
	  	else
	  		flash.alert = "Error: Dual not created.  Please confirm all required fields are populated."
	  	end 
	  	redirect_to edit_admin_dual_path(@dual)
	  end

	def mass_create


		# Still does not change date to the correct year.

		params[:school][:duals_attributes].values.each do |dual_data|
  	p dual_data

  	@d = Dual.new(dual_data)

  		# yr = dual_data["date(1i)"].to_i
	  	# mon = dual_data["date(2i)"].to_i
	  	# day = dual_data["date(3i)"].to_i
  	if @d.save
  		p "Passed"
  	end

	end
    	redirect_to (:back)
 	 
 	end

 	def masscreate2
 		# strong_params is an array that needs to be iterated over for each create method.
 		duals_info.each do |this|
 			@dual = Dual.new(this)
 			@dual.save
 		end
 		redirect_to (:back)
 	end



	  private 
	  def dual_info
	  	params.require(:dual).permit(:time, :dual_result, :site, :team1_id, :team2_id, :team1_score, :team2_score, :tie_break, :w, :l, :t, :attendance, :complete, :estimated)
	  end

	  def duals_info
	  	params.permit(:duals => [ :team1_id, :site, :team2_id, :season_id, :month, :day, :time, :hour, :minute]).require(:duals).tap do |whitelisted|
	  	i = 0
	  	whitelisted.each do |instance|
	  		month = params[:duals][i][:month].to_i
	  		year = params[:duals][i][:season_id].to_i
	  		day = params[:duals][i][:day].to_i
	  		hour = params[:duals][i][:hour].to_i
	  		min = params[:duals][i][:minute].to_i
	  		if month < 7
	  			year = year
	  		elsif month > 7
	  			year = year - 1
	  		end   

	  		instance[:date] = Date.new(year, month, day)
	  		# p "Current iteration of time"
	  		# p params[:duals][i][:time]
	  		# p "new iteration of time"
	  		instance[:time] = Time.new(year, month, day, hour, min)
	  		# Time.new(year, month, day, hour, min)
	  		# p "***************"
	  		# p "***************"

	  		i = i+1

	  	# params[:duals][:time]['time(1i)']
	  	end
	  end
	  end

	 #  params.require(:user).permit(:username).tap do |whitelisted|
  # 		whitelisted[:data] = params[:user][:data]
		# end

	  def multi_dual
	  	params.require(:school).permit(:dual_attributes => [:id, :date, :month, :day, :time, :dual_result, :site, :team1_id, :team2_id, :_destroy])
       end

	end
	
end