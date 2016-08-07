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

class Destination < ActiveRecord::Base
	has_many :sales
	validates :city, presence: true, length: 3..30
	validates :country, presence: true, length: 3..30
	validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :taxes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :total, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
