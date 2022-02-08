class PagesController < ApplicationController
    def home
        @notes = Note.published.order('updated_at desc').paginate(page: params[:page], per_page: 2)
    end
end