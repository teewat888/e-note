# == Schema Information
#
# Table name: note_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint
#  tag_id     :bigint
#
# Indexes
#
#  index_note_tags_on_note_id  (note_id)
#  index_note_tags_on_tag_id   (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (tag_id => tags.id)
#
class NoteTag < ApplicationRecord
    belongs_to :note
    belongs_to :tag
end
