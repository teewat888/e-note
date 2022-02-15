class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :destroy]
    before_action :require_log_in, except: [:show, :index]
    before_action :require_owner, only: [:edit, :update, :destroy]


    def new 
        @comment = Comment.new
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit 

    end

    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_to note_path(params[:note_id]), notice: "Comment posted."
        end  
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        #views/comments/destroy.js.erb
        respond_to do |format|
            format.html
            format.js
        end
    end

    private

    def set_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.permit(:content, :user_id, :note_id)
    end

    def require_owner
        redirect_to root_path, alert: "You are not autorized to perform this action" unless (@comment.user == current_user) || (current_role == 'admin')
    end

end