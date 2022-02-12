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
class User < ApplicationRecord
    has_many :notes
    belongs_to :role
    has_many :comments
    has_many :notes, through: :comments
    has_many :acknowledges
    has_many :notes, through: :acknowledges

    has_secure_password
end
