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

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
