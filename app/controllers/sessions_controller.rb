class SessionsController < ApplicationController

  def new
  end


  def create
      user = User.find_by(name: params[:user][:name])
      authenticated = user.try(:authenticate, params[:user][:password])
     # binding.pry
      if authenticated
        
          @user = user
          session[:user_id] = @user.id
          redirect_to(controller: 'users', action: 'welcome')
      else
          redirect_to(controller: 'sessions', action: 'new')
      end
  end

  def destroy
      session.delete :name
      redirect_to action: "new"
  end
end