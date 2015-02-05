# == Schema Information
#
# Table name: apartments
#
#  id                 :integer          not null, primary key
#  city_id            :integer
#  district_id        :integer
#  owner_id           :integer
#  discription        :text(65535)
#  personal_amount    :integer
#  public_room_amount :integer
#  balcony_amount     :integer
#  kitchen            :boolean
#  type               :integer
#  address_details    :string(255)
#  area_size          :float(24)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
