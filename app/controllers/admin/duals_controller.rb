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
		p "*****"
		p "*****"
		p "*****"
		p "*****"


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

		# Dual.create(multi_dual)


		# @duals = 
		# p params[:school][:duals_attributes]
		# for i in 0...@duals.length
		# # if Dual.create(params[:school][:duals_attributes]['#{i}'])
		# p i

		# # p @duals[i].inspect
		# # 	p "passed ***********"
		# # else
		# # 	p "Failed *****"
		# # end


		# # .each do |multi_dual|
		# # 	p "*****"
		# # 	Dual.create(multi_dual.first.to_hash)
		# # 	p "*****"

		# end
		# Dual.create(multi_dual)

    	p "reached mass create *************"
    	  	# p params[:school][:duals_attributes].json
    	  	# p params[:school].to_json
 	 
    	p "**************"
    	# p params[:dual_attributes][0].inspect
    	redirect_to (:back)
 	 
 	end



	  private 
	  def dual_info
	  	params.require(:dual).permit(:time, :dual_result, :site, :team1_id, :team2_id, :team1_score, :team2_score, :tie_break, :w, :l, :t, :attendance, :complete, :estimated)
	  end

	  def multi_dual
	  	params.require(:school).permit(:dual_attributes => [:date, :time, :dual_result, :site, :team1, :team2_id])
       end

	end
	
end