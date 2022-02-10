class PagesController < ApplicationController

    def home
        ## filter wing note and hard code main of id 1 = all wings
        @notes = Note.published.joins(:wings)
        .where("wings.id = #{current_wing.id} or wings.id = 1")
        .order('updated_at desc')
        .paginate(page: params[:page], per_page: 5)
    end
        

end