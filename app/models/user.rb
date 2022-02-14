# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :bigint
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
class User < ApplicationRecord
    has_many :notes
    belongs_to :role
    has_many :comments
    has_many :memos, through: :comments, class_name: "Note"
    has_many :acknowledges
    has_many :topics, through: :acknowledges, class_name: "Note"
   
    has_secure_password
    #find unack notes 
    def self.unack_notes(user:)
        all_ack_notes = Note.notes_require_ack.pluck(:id)
        notes_user_ack = Acknowledge.select(:note_id).where(user_id: user.id).pluck(:note_id)
        Note.where(id: (all_ack_notes - notes_user_ack))
    end

    def self.unack_notes_count(user:)
        self.unack_notes(user: user).count
    end

end
