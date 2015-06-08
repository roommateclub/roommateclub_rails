# == Schema Information
#
# Table name: rent_case_groups
#
#  id           :integer          not null, primary key
#  rent_case_id :integer
#  group_id     :integer
#

class RentCaseGroup < ActiveRecord::Base
  belongs_to :rent_case
  belongs_to :group
end
