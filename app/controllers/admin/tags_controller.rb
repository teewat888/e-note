class Admin::TagsController < ApplicationController
    before_action :set_tag, only: [:edit, :update]
    before_action :require_log_in
    before_action :require_admin

    def index
        @tags = Tag.all
    end
    
    def new

    end

    def create

    end

    def edit

    end

    def update

    end

    private
    def set_tag
        @tag = Tag.find(params[:id])
    end
end