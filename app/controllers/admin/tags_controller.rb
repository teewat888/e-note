class Admin::TagsController < ApplicationController
    before_action :set_tag, only: [:edit, :update]
    before_action :require_log_in
    before_action :require_admin
    before_action(only: [:create, :update]) { check_cancel(admin_tags_path) }

    def index
        @tags = Tag.all
    end
    
    def new
        @tag = Tag.new
    end

    def create
        @tag = Tag.new(tag_params)
        if @tag.save
            redirect_to admin_tags_path, notice: 'Tag created.'
        else 
            render :new
        end
    end

    def edit

    end

    def update
        if @tag.update(tag_params)
            redirect_to admin_tags_path, notice: 'Tag updated.'
        else
            render :edit
        end
    end

    private
    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name)
    end

end