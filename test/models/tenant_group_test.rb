# == Schema Information
#
# Table name: tenant_groups
#
#  id             :integer          not null, primary key
#  title          :string
#  share_case_id  :integer
#  group_size     :integer
#  description    :text
#  workflow_state :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class TenantGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
