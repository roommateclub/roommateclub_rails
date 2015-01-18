# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  nickname   :string(255)
#  gender     :integer
#  birthdate  :datetime
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ActiveRecord::Base
  belongs_to :user
end
