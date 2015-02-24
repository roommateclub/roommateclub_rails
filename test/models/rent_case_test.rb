# == Schema Information
#
# Table name: rent_cases
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  landlord_id  :integer
#  price        :integer
#  move_in_date :datetime
#  discription  :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state        :string(255)
#

require 'test_helper'

class RentCaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
