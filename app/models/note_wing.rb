# == Schema Information
#
# Table name: note_wings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint
#  wing_id    :bigint
#
# Indexes
#
#  index_note_wings_on_note_id  (note_id)
#  index_note_wings_on_wing_id  (wing_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#  fk_rails_...  (wing_id => wings.id)
#
class NoteWing < ApplicationRecord
    belongs_to :note
    belongs_to :wing
end
