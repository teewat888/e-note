# == Schema Information
#
# Table name: wings
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Wing < ApplicationRecord
    has_many :wing_notes
    has_many :notes, through: :wing_notes
    
end
