class SettingsController < ApplicationController
    before_action(only: [:wing]) { check_cancel(root_path) }

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