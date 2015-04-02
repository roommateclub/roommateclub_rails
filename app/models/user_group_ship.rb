# == Schema Information
#
# Table name: user_group_ships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  state      :string           
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  message    :text
#

class UserGroupShip < ActiveRecord::Base
  belongs_to :user
  belongs_to :group

  include Workflow
  workflow_column :state
  
  workflow do 
    state :pending do
      event :accept, transition_to: :joined
      event :reject, transition_to: :rejected
    end

    state :joined
    state :rejected
  end

  # workflow events
  def accept
  end


end
