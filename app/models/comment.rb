# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_comments_on_note_id  (note_id)
#  index_comments_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
    belongs_to :note
    belongs_to :user
end
