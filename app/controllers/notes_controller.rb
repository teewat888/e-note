class NotesController < ApplicationController
    before_action :set_note, only: [:edit, :show, :update]

    def index
        @notes = Note.all
    end

    def show

    end

    def new
        @note = Note.new
    end

    def create 
        note = Note.new(note_params)
        #need to change whne auth
        note.user = User.find(1)
        if note.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit 

    end

    def update 
         #need to change whne auth
        @note.user = User.find(1)
        if @note.update(note_params)
            redirect_to root_path, notice: "Note has been updated"
        end
    end

    private

    def set_note 
        @note = Note.find(params[:id])
    end

    def note_params 
        params.require(:note).permit(:title, :content, :require_ack, :bump, wing_ids:[])
    end

end