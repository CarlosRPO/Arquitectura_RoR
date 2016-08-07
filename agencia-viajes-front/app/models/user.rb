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

class User < ActiveRecord::Base
	has_many :permissions
	has_secure_password

	validates :name, presence: true
	validates :last_name, presence: true
	validates :user_name, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
