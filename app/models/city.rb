# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class City < ActiveRecord::Base
  has_many :districts
  has_many :addresses, through: :districts
  has_many :apartment, through: :addresses
end
