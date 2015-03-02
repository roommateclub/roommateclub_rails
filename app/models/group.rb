# == Schema Information
#
# Table name: groups
#
#  id           :integer          not null, primary key
#  rent_case_id :integer
#  organizer_id :integer
#  group_size   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Group < ActiveRecord::Base
  has_many :users, through: :user_group_ships
  belongs_to :rent_case
  belongs_to :organizer, class_name: :User
end
