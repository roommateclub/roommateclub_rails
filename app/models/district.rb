# == Schema Information
#
# Table name: districts
#
#  id         :integer          not null, primary key
#  name       :string
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class District < ActiveRecord::Base
  has_many :addresses
  has_many :apartments, through: :addresses
  belongs_to :city

end
