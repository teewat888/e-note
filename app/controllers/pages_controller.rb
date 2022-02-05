class PagesController < ApplicationController
    def home
        @notes = Note.published
    end
end