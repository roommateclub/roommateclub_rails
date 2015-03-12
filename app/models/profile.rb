# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  nickname   :string
#  gender     :integer
#  birthdate  :datetime
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ActiveRecord::Base
  enum gender: [:male, :female]
  belongs_to :user

  validates_presence_of :gender
end
