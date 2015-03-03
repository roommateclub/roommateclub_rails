# == Schema Information
#
# Table name: rent_cases
#
#  id           :integer          not null, primary key
#  apartment_id :integer
#  owner_id     :integer
#  price        :integer
#  move_in_date :datetime
#  discription  :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  state        :string(255)
#  type         :string(25)
#

class RentCase < ActiveRecord::Base

  include Workflow

  belongs_to :apartment
  belongs_to :owner, class_name: :User
  has_many :groups

  accepts_nested_attributes_for :apartment, :groups

  
  workflow_column :state
  workflow do
    state :active
    state :rented
    state :expired
  end

  # def rent
  #   puts "cool"
  # end


end
