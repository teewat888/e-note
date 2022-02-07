module ApplicationHelper

    def display_wing(note)
        note.wings.collect { |n| n.name }.join ','
    end
    
end
