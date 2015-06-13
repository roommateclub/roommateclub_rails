# == Schema Information
#
# Table name: share_cases
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  user_id      :integer
#  price        :integer
#  move_in_date :datetime
#  discription  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ShareCase < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :owner, class_name: User, foreign_key: :user_id
  has_one :tenant_group

  accepts_nested_attributes_for :apartment, :tenant_group
end
