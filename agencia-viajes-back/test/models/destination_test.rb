# == Schema Information
#
# Table name: destinations
#
#  id         :integer          not null, primary key
#  city       :string
#  country    :string
#  price      :integer          default(0)
#  taxes      :integer          default(0)
#  total      :integer          default(0)
#  status     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DestinationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
