class CommentsController < ApplicationController
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
        @comment = Comment.find(params[:id])
        @comment.destroy
        
        respond_to do |format|
            format.html
            format.js
        end
    end

    private

    def comment_params
        params.permit(:content, :user_id, :note_id)
    end

end