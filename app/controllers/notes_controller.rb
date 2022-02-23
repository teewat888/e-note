class NotesController < ApplicationController
    before_action :set_note, only: [:edit, :show, :update, :destroy, :bump]
    before_action :require_log_in, except: [:show, :index, :bump]
    before_action :require_owner, only: [:edit, :update, :bump]
    before_action(only: [:create, :update]) { check_cancel(root_path) }

    def index
        if params[:user_id]
            @notes = User.find(params[:user_id]).notes.paginate(page: params[:page], per_page: 5)
        elsif params[:wing_id]
            @notes = Wing.find(params[:wing_id]).notes.published.paginate(page: params[:page], per_page: 5)
        elsif params[:tag_id]
            @notes = Tag.find(params[:tag_id]).notes.published.paginate(page: params[:page], per_page: 5)
        else
            # filter based on cookies setting
            @notes = Note.published.joins(:wings)
            .where("wings.id = #{current_wing.id}")
            .paginate(page: params[:page], per_page: 5)
        end
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

    def bump
        bump = @note.bump
        bump = 0 if bump.nil?
        if @note.update(bump: bump += 1)
            redirect_to root_path, notice: "Note moved to the top!"
        else
            redirect_to root_path, alert: "Failed to move note to the top!"
        end
    end

    def search
        if params[:query].present?
            @notes = Note.note_search(params[:query]).published.paginate(page: params[:page], per_page: 5)
        else
            @notes = Note.none
        end
        render 'index'
    end

    private

    def set_note 
        @note ||= Note.find(params[:id])
        redirect_to root_path, alert: "No note found!" unless @note
    end

    def note_params 
        params.require(:note).permit(:title, :content, :require_ack, :bump, :user_id, :published, wing_ids:[], tag_ids:[])
    end

    def require_owner
        redirect_to root_path, alert: "You are not authorized to perform this action!" unless (@note.user == current_user) || (current_role == 'admin')
    end

end