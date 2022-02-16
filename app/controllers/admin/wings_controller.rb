class Admin::WingsController < ApplicationController
    before_action :set_wing, only: [:show, :edit, :update]
    before_action :require_log_in
    before_action :require_admin

    def index
        @wings = Wing.all.order(:display_order)
    end

    def new
        @wing = Wing.new
    end

    def create
        if Wing.create(wing_params)
            redirect_to admin_wings_path
        end
    end

    def show

    end

    def edit

    end

    def update
        if @wing.update(wing_params)
            redirect_to admin_wings_path
        end
    end

    private

    def set_wing
        @wing = Wing.find(params[:id])
    end

    def wing_params 
        params.require(:wing).permit(:name, :display_order)
    end

end