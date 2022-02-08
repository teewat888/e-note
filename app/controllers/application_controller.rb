class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?, :current_user_role

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def current_user_role
        current_user.role.name
    end

    def must_be_admin
        redirect_to root_path, alert: "You are not authorized to perform this action" unless current_user_role == "admin"
    end

    def must_log_in
        redirect_to root_path, alert: "You must log in to perform this action" if !logged_in?
    end
end
