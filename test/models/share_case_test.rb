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

require 'test_helper'

class ShareCaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
