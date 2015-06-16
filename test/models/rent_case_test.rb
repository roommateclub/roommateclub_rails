# == Schema Information
#
# Table name: rent_cases
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  user_id      :integer
#  price        :integer
#  move_in_date :datetime
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state        :string
#

require 'test_helper'

class RentCaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
