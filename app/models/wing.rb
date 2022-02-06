# == Schema Information
#
# Table name: wings
#
#  id            :bigint           not null, primary key
#  display_order :integer
#  name          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Wing < ApplicationRecord
    has_many :note_wings
    has_many :notes, through: :note_wings

end
