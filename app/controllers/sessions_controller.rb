class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    redirect_to root_path if params[:user][:password].blank?
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      head(:forbidden)
    end

  end
  def welcome
    return head(:forbidden) unless session[:user_id].present?
  end
end
