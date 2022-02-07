# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  role_id         :bigint
#
# Indexes
#
#  index_users_on_role_id  (role_id)
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
