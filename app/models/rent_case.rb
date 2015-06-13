# == Schema Information
#
# Table name: rent_cases
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  user_id      :integer
#  price        :integer
#  move_in_date :datetime
#  discription  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state        :string
#

class RentCase < ActiveRecord::Base

  include Workflow

  belongs_to :apartment
  belongs_to :owner, class_name: :User

  has_one :address, through: :apartment
  has_many :pins, foreign_key: :rent_case_id
  has_many :groups, through: :pins

  accepts_nested_attributes_for :apartment

  workflow_column :state
  workflow do
    state :active do
      event :rent, transitions_to: :rented
    end
    state :rented
    state :expired
  end

  def rent
    
  end

  def can_create_group?(user)
    if self.type == "LandlordRentCase"
      true unless self.groups.where(organizer: user).exists?
    else
      self.group.nil? ? true : false
    end
  end


end
