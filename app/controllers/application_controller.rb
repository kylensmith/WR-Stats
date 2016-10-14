class ApplicationController < ActionController::Base
  helper :all
 
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private
# checks to see if user is a an admin.  can be called anywhere
     def is_admin?
     	# Authenticate_user
       unless current_user.admin
       	flash.alert = "You must be logged in as an admin to do that."
       	redirect_to root_path 
   		end
     end

     def is_super_admin?
       unless current_user.super_admin
       	flash.alert = "You must be logged in as an super-admin to do that."
       	redirect_to request.referer
   		end
     end
   

end
