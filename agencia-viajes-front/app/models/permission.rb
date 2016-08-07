# == Schema Information
#
# Table name: permissions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  action     :string
#  view       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Permission < ActiveRecord::Base
  belongs_to :user
end
