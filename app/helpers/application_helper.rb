module ApplicationHelper

    def display_wing(note)
        note.wings.collect { |n| n.name }.join ','
    end

    def display_tag(note)
        sanitize note.tags.collect { |tag| "<span class='badge badge-info'>#{tag.name}</span>" }.join(' ')
    end
    
    def is_ack?(user_id:, note_id:)
        Acknowledge.is_exist?(user_id: user_id, note_id: note_id)
    end

    def highlight_style
        '<span style="color:red"><em>\1</em></span>'
    end

end
