# == Schema Information
#
# Table name: tokens
#
#  id                :integer          not null, primary key
#  token             :string
#  number_of_request :integer          default(0)
#  status            :boolean          default(TRUE)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class TokenTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
