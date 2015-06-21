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

class Address < ActiveRecord::Base
  belongs_to :apartment
  belongs_to :district

  delegate :city, to: :district

  attr_accessor :city_id

  geocoded_by :display               # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def address_display
    "#{postcode},#{city.name}, #{district.name}, #{street}"
  end
end
