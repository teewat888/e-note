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
require "test_helper"

class WingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
