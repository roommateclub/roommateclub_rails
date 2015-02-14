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

class Apartment < ActiveRecord::Base
  has_many :rent_cases
  belongs_to :landlord, class_name: "User"
  belongs_to :city
  belongs_to :district
  
  enum type: [:stair, :elevator]

  def full_address
    # [city.attributes, district.attributes, address_details].compact.join(" ")
  end
end
