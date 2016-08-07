# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  last_name       :string
#  user_name       :string
#  email           :string
#  password_digest :string
#  birth_date      :date
#  status          :boolean          default(TRUE)
#  phone           :string
#  identification  :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
