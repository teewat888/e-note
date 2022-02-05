# == Schema Information
#
# Table name: wing_notes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  notes_id   :bigint
#  wings_id   :bigint
#
# Indexes
#
#  index_wing_notes_on_notes_id  (notes_id)
#  index_wing_notes_on_wings_id  (wings_id)
#
class WingNote < ApplicationRecord
    belongs_to :wing
    belongs_to :note
end
