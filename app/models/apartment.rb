# == Schema Information
#
# Table name: apartments
#
#  id                 :integer          not null, primary key
#  landlord_id        :integer
#  discription        :text
#  public_room_amount :integer
#  balcony_amount     :integer
#  kitchen            :boolean
#  type               :integer
#  address_details    :string
#  area_size          :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Apartment < ActiveRecord::Base
  has_one :address
  has_many :rent_cases
  belongs_to :landlord, class_name: "User"
  belongs_to :district
  belongs_to :city
  
  enum type: [:stair, :elevator]

  accepts_nested_attributes_for :address
  attr_accessor :is_landlord, :city_id

  # def self.register(params, current_user_id)
  #   current_apartment = self.new(params)
  #   current_apartment.landlord_id = current_user_id if params[:is_landlord] == true
  #   return current_apartment
  #   # Move this to service PORO
  # end

  def register_apartment(is_landlord, option = {})
    landlord_id = option[:landlord_id]
  end

  def full_address
    # [city.attributes, district.attributes, address_details].compact.join(" ")
  end
end
