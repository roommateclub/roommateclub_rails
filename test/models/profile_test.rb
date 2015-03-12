# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  nickname   :string
#  gender     :integer
#  birthdate  :datetime
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
