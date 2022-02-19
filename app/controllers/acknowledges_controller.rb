class AcknowledgesController < ApplicationController
    before_action :require_log_in, only: [:index, :create]
    before_action :require_manager, only: [:index, :create]
    
    def index
        if (params[:user_id])
            @notes = User.unack_notes(user: User.find(params[:user_id])).order('updated_at desc').paginate(page: params[:page], per_page: 5) 
            render 'notes/index'
        end
        @notes = Note.require_acknowledge.order('updated_at desc').paginate(page: params[:page], per_page: 5) 
    end

    def create
        if !Acknowledge.is_exist?(user_id: params[:user_id], note_id: params[:note_id])
            Acknowledge.create(acknowledge_params)
            redirect_to note_path(params[:note_id])
        end
    end

    private

    def set_acknowledge 
        @acknowledge = Acknowledge.find(params[:id])
    end

    def acknowledge_params
        params.permit(:user_id, :note_id)
    end

end