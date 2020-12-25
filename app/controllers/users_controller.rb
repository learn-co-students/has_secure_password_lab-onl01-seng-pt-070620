class UsersController < ApplicationController
    def new
        @user = User.new 
    end 

    def create 
        @user = User.create(user_params)
        # binding.pry
        if !@user.save 
            redirect_to signup_path
        else 
            session[:user_id] = @user.id 
            redirect_to '/'
        end 
    end 

    def welcome
        @user = (User.find_by(id: session[:user_id]) || User.new)
        # binding.pry
    end 

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end 
end
