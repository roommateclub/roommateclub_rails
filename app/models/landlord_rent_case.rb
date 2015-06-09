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

class LandlordRentCase < RentCase
  has_many :rent_case_groups, foreign_key: :rent_case_id
  has_many :groups, through: :rent_case_groups
end
