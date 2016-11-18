module Admin
class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_admin?
  before_filter :is_super_admin?, only: [:edit, :update]

  def edit
    @user = User.find(params[:id])
    if @user == User.first
      redirect_to root_path
    end
    @title = "Admin: Edit User"
  end

  def update
  	@user = User.find(params[:id])
    if @user == User.first
      redirect_to root_path
    end
  	@user.update(user_rights)
  	if @user.save
  		redirect_to admin_users_path
  	else
  		flash.warning = "User's rights were not able to be changed. Please try again."
  		redirect_to edit_admin_user(@user)
  	end
  end

  def index
  	@adm = User.all
    @title = "Admin: Users"
  end

private

def user_rights
    params.require(:user).permit(:admin, :super_admin)
 end

end
end
