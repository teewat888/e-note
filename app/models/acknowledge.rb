# == Schema Information
#
# Table name: acknowledges
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_acknowledges_on_note_id  (note_id)
#  index_acknowledges_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (user_id => users.id)
#
class Acknowledge < ApplicationRecord
    belongs_to :user
    belongs_to :note

    #check is a user ack a note? 
    def self.is_exist?(user_id:, note_id:)
        Acknowledge.where("user_id = #{user_id} and note_id = #{note_id}").count == 1 ? true : false
    end
    #return list of user(s) who read a note
    def self.people_ack(note:)
        User.find(Acknowledge.select(:user_id).where(note_id: note.id).pluck(:user_id))
    end
    #return list of user(s) who note read a note
    def self.people_not_ack(note:)
        user_read_array = Acknowledge.select(:user_id).where(note_id: note.id).pluck(:user_id)
        all_user_array =  User.joins(:role).where('roles.name = ?', 'staff').pluck(:id)
        User.find(all_user_array - user_read_array)
    end

end
