class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:current_user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:sign_up_error] = "An error occured while signing up."
  		redirect_to new_user_path
  	end
  end

  private

  def user_params
  	params.require(:user).permit(:name,:password,:password_confirmation)
  end
end
