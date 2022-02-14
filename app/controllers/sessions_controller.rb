class SessionsController < ApplicationController
    def new 
    end

    def create
        user = User.find_by(username: params[:username])
        
        user = user.try(:authenticate, params[:password])

        if user
            session[:user_id] = user.id
            redirect_to root_path, notice: "Logged in successfully"
        else
            redirect_to root_path, alert: "Invalid username/password"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path, notice: "Logged out"
    end

end