class SettingsController < ApplicationController
    before_action :check_cancel, only: [:wing]

    def index 

    end

    def wing
        cookies.permanent[:wing_id] = params[:wing_ids]
        redirect_to root_path, notice: "This computer location is at #{current_wing.name}"
    end

    private

    def setting_params 
        params.permit(:wing_ids)
    end
    
end