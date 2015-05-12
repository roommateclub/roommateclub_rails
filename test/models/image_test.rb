# == Schema Information
#
# Table name: assets
#
#  id            :integer          not null, primary key
#  viewable_id   :integer
#  viewable_type :string
#  file          :string
#  type          :string
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
