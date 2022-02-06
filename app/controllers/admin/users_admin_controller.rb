class Admin::UsersAdminController < ApplicationController
    before_action :set_user, only: [:edit, :update]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.valid?
            user.save
            flash[:success] = "New user has been created." 
            redirect_to admin_users_admin_index_path
        end
    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:success] = "User has been updated." 
            redirect_to admin_users_admin_index_path
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params 
        params.require(:user).permit(:username, :email, :password)
    end

end