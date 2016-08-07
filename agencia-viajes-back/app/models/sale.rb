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

class Sale < ActiveRecord::Base
  belongs_to :customer
  belongs_to :destination
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :total, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
