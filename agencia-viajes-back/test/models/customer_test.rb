# == Schema Information
#
# Table name: customers
#
#  id             :integer          not null, primary key
#  name           :string
#  last_name      :string
#  identification :string
#  email          :string
#  birth_date     :date
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
