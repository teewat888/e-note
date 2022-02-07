class PagesController < ApplicationController
    def home
        @notes = Note.published.order('updated_at desc')
    end
end