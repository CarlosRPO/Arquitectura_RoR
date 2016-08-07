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

class Token < ActiveRecord::Base
	before_create :asignar_token

	validates :number_of_request, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	def self.authenticate(auth_token)
		find_by(token: auth_token)
	end

	private
	
	def asignar_token
		self.token = SecureRandom.uuid
	end
	
end
