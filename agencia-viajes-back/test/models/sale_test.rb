# == Schema Information
#
# Table name: sales
#
#  id             :integer          not null, primary key
#  customer_id    :integer
#  destination_id :integer
#  quantity       :integer          default(1)
#  total          :integer          default(0)
#  sale_date      :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class SaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
