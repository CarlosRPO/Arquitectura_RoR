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

class Customer < ActiveRecord::Base
	has_many :sales
	validates :name, presence: true, length: 3..30
	validates :last_name, presence: true, length: 3..30
	validates :identification, presence: true, numericality: { only_integer: true }
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
