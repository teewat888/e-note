class AcknowledgesController < ApplicationController
    before_action :require_log_in, :require_manager, only: [:index]

    def index
        @notes = Note.notes_require_ack.order('updated_at desc').paginate(page: params[:page], per_page: 5) 
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