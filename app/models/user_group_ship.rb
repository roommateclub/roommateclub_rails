# == Schema Information
#
# Table name: user_group_ships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserGroupShip < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
end
