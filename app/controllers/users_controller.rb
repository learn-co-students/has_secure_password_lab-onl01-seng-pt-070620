class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        #byebug
        @user = User.create(user_params)
        if !@user.save #&& @user.password != @user.password_confirmation
            redirect_to new_user_path
        else
            session[:user_id] = @user.id
            redirect_to '/'
        end   
    end

    def welcome
        @user = (User.find_by(id: session[:user_id]) || User.new)
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end