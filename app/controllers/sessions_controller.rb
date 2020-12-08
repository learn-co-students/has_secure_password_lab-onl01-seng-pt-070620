class SessionsController < ApplicationController
    def new
    end

    def create
       
        if params[:user][:name] == ""
             flash[:notice] = "Please Enter Username"
             redirect_to login_path
        elsif params[:user][:password] == ""
            flash[:notice] = "Please Enter Password"
            redirect_to login_path
        else
            if @user = User.find_by(name: params[:user][:name])
                if @user.authenticate(params[:user][:password])
                    session[:user_id] = @user.id
                    redirect_to '/'
                else
                    flash[:notice] = "Password is incorrect!"
                    redirect_to login_path
                end
            else
                flash[:notice] = "Username is incorrect!"
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end
end