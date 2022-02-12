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
require "test_helper"

class AcknowledgeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
