class CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :destroy]
    before_action :must_log_in, except: [:show, :index]
    before_action :must_same_user, only: [:edit, :update, :destroy]


    def new 
        @comment = Comment.new(note_id: params[:note_id])
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def edit 

    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            redirect_to note_path(params[:note_id]), notice: "Comment posted."
        end
    end

    def destroy
        flash.now[:alert] = "Comment deleted."
        @comment = Comment.find(params[:id])
        @comment.destroy
       
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

    def must_same_user
        redirect_to root_path, alert: "You are not autorized to perform this action" unless @comment.user == current_user
    end

end