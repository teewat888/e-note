class Admin::UsersAdminController < ApplicationController
    before_action :set_user, only: [:edit, :update]
    before_action :must_log_in
    before_action :must_be_admin
    before_action :check_cancel, only: [:create, :update]

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
            redirect_to admin_users_admin_index_path, notice: "New user has been created."
        end
    end

    def edit
        
    end

    def update
        if @user.update(user_params)
            redirect_to admin_users_admin_index_path, notice: "User has been updated."
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params 
        params.require(:user).permit(:username, :email, :password, :role_id)
    end

    def check_cancel
        redirect_to admin_users_admin_index_path if params[:commit] == 'Cancel'
    end

end