# == Schema Information
#
# Table name: user_group_ships
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  groupable_id   :integer
#  state          :string           default("0")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  message        :text
#  groupable_type :string
#  is_organizer   :boolean
#

class UserGroupShip < ActiveRecord::Base
  belongs_to :user
  belongs_to :groupable, polymorphic: true

  validates_uniqueness_of :user_id, scope: :groupable_id
  

  include Workflow
  workflow_column :state
  
  workflow do 
    state :pending do
      event :approve, transitions_to: :approved
      event :reject, transitions_to: :rejected
    end

    state :approved
    state :rejected

    after_transition do
      activate_group
    end
  end

  # workflow events
  def approve
  end

  def activate_group
    groupable.activate! if groupable.has_enough_roommates?
  end

  def reject
  end


end
