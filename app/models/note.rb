# == Schema Information
#
# Table name: notes
#
#  id          :bigint           not null, primary key
#  bump        :integer
#  content     :text
#  published   :boolean          default(TRUE)
#  require_ack :boolean
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_notes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Note < ApplicationRecord
  has_rich_text :content
  belongs_to :user
  has_many :wing_notes
  has_many :wings, through: :wing_notes

  scope :published, -> { where(:published => true) }

end
