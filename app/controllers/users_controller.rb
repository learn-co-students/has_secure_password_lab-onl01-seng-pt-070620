class UsersController < ApplicationController
  def welcome
      @user = current_user
  end
  
  def new
  end

  def create
      @user = User.create(user_params)
      redirect_to action: 'new' unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
  end
  
  private
  
  def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
  end
end