# == Schema Information
#
# Table name: apartments
#
#  id                 :integer          not null, primary key
#  landlord_id        :integer
#  description        :text
#  public_room_amount :integer
#  balcony_amount     :integer
#  kitchen            :boolean
#  type               :integer
#  address_details    :string
#  area_size          :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
