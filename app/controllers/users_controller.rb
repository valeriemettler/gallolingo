class UsersController < ApplicationController
  before_action :save_login_state, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if params[:remember_me]
        cookies.permanent[:auth_token] = @user.auth_token
      else
        cookies[:auth_token] = @user.auth_token
      end
      flash[:notice] = "You signed up succesfully"
      flash[:color] = "valid"
      redirect_to root_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color] = "invalid"
      redirect_to new_user_path
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:email,  :username, :password)
  end

end