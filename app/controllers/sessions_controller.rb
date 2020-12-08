class SessionsController < ApplicationController

  def new
  end


  def create
      user = User.find_by(name: params[:name])
      authenticated = user.try(:authenticate, params[:password])
      if authenticated
          @user = user
          session[:user_id] = @user.id
          redirect_to(controller: 'users', action: 'welcome')
      else
          redirect_to action: 'new'
      end
  end

  def destroy
      session.delete :name
      redirect_to action: "new"
  end
end