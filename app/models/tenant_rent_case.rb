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
  has_one :group, foreign_key: "rent_case_id"
  accepts_nested_attributes_for :group
end
