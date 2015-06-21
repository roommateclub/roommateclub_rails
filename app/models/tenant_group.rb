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

class TenantGroup < ActiveRecord::Base
  include Workflow

  has_many :user_group_ships, as: :groupable
  has_many :users, through: :user_group_ships, as: :groupable
  belongs_to :share_case
  attr_accessor :user_id
  after_create :create_organizer_user_group_ship

  workflow do
    state :pending do
      event :activate, transition_to: :activated
    end
    state :activated
    state :expired
  end
# workflow events start
  def activate
    if rent_case.type == "TenantRentCase"
      rent_case.rent!
    end
  end
# workflow events end

  def organizer
    user_group_ships.find_by(is_organizer: true).user
  end

  def joined_roommates(option={})
    if option[:include_organizer].present? 
      user_group_ships.with_approved_state.map(&:user) 
    else
      user_group_ships.with_approved_state.map(&:user) - [organizer]
    end
  end

  def has_enough_roommates?
    joined_roommates.size == group_size
  end

  def create_organizer_user_group_ship
    self.user_group_ships.create(user_id: user_id, state: "approved", is_organizer: true)
  end
end
