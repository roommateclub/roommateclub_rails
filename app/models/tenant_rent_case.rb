# == Schema Information
#
# Table name: rent_cases
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  owner_id     :integer
#  price        :integer
#  move_in_date :datetime
#  discription  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state        :string
#  type         :string(25)
#

class TenantRentCase < RentCase
  has_one :rent_case_group, foreign_key: :rent_case_id
  has_one :tenant_group, through: :rent_case_group, class_name: 'Group'

  # has_one :captain_membership, -> { where captain: true}, class_name: 'Membership'
  # has_one :captain, through: :captain_membership, source: :player
  accepts_nested_attributes_for :tenant_group
end
