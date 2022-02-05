class NotesController < ApplicationController
    before_action :set_note, only: [:edit, :show, :update]

    def index
        @notes = Note.all
    end

    def show

    end

    def new

    end

    def create 

    end

    def edit 

    end

    def update 
        @note.user = User.find(1)
        if @note.update(note_params)
            flash[:success] = "Note has been updated"
            redirect_to @note
        end
    end

    private

    def set_note 
        @note = Note.find(params[:id])
    end

    def note_params 
        params.require(:note).permit(:title, :content, :require_ack, :bump)
    end

end