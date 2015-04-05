# == Schema Information
#
# Table name: addresses
#
#  id           :integer          not null, primary key
#  district_id  :integer
#  apartment_id :integer
#  street       :string
#  postcode     :string
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
