class NotesController < ApplicationController
    before_action :set_note, only: [:edit, :show, :update, :destroy]
    before_action :must_log_in, except: [:show, :index]
    before_action :must_same_user, only: [:edit, :update]
    before_action :check_cancel, only: [:create, :update]

    def index
        @notes = Note.all
    end

    def show
    end

    def new
        @note = Note.new
    end

    def create 
        @note = Note.new(note_params)
        
        @note.user = current_user
        if @note.save
            redirect_to root_path, notice: "Note created successfully"
        else
            render 'new'
        end
    end

    def edit 

    end

    def update 
        if @note.update(note_params)
            redirect_to root_path, notice: "Note has been updated"
        else
            render 'edit'
        end
    end

    private

    def set_note 
        @note ||= Note.find(params[:id])
        redirect_to root_path, alert: "No note found!" unless @note
    end

    def note_params 
        params.require(:note).permit(:title, :content, :require_ack, :bump, wing_ids:[])
    end

    def must_same_user
        redirect_to root_path, alert: "You are not authorized to perform this action!" unless (@note.user == current_user) || (current_role == 'admin')
    end

end