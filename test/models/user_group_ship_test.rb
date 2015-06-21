# == Schema Information
#
# Table name: user_group_ships
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  groupable_id   :integer
#  state          :string           default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  message        :text
#  groupable_type :string
#  is_organizer   :boolean
#

require 'test_helper'

class UserGroupShipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
