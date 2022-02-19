# == Schema Information
#
# Table name: notes
#
#  id          :bigint           not null, primary key
#  bump        :integer
#  content     :text
#  published   :boolean          default(TRUE)
#  require_ack :boolean          default(FALSE)
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
    include PgSearch::Model

    has_rich_text :content
    belongs_to :user
    has_many :note_wings
    has_many :wings, through: :note_wings
    has_many :comments
    has_many :users, through: :comments
    has_many :acknowledges
    has_many :staff, through: :acknowledges, class_name: "User"
    has_many :note_tags
    has_many :tags, through: :note_tags
    
    scope :published, -> { where(:published => true) }
    scope :require_acknowledge, -> { where(:require_ack => true).where(:published => true) }
    default_scope { order(updated_at: :desc) }

    validates :title, presence: true
    validates :content, presence: true

    pg_search_scope :note_search,
      against: :title,
      using: {
                    tsearch: {
                      highlight: {
                        StartSel: '<b>',
                        StopSel: '</b>',
                        MaxWords: 123,
                        MinWords: 456,
                        ShortWord: 4,
                        HighlightAll: true,
                        MaxFragments: 3,
                        FragmentDelimiter: '&hellip;'
                      }
                    }
                  },
      associated_against: {
      rich_text_content: [:body]
    }

end
