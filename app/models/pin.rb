# == Schema Information
#
# Table name: pins
#
#  id           :integer          not null, primary key
#  rent_case_id :integer
#  group_id     :integer
#

class Pin < ActiveRecord::Base
  belongs_to :rent_case
  belongs_to :group
end
