module ApplicationHelper

    def display_wing(note)
        note.wings.collect { |n| n.name }.join ','
    end
    
    def is_ack?(user_id:, note_id:)
        Acknowledge.is_exist?(user_id: user_id, note_id: note_id)
    end

end
