# == Schema Information
#
# Table name: session_logs
#
#  id            :integer          not null, primary key
#  user_name     :string
#  logged_date   :date
#  success       :boolean
#  error_message :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SessionLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
