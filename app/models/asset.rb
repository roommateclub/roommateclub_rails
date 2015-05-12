# == Schema Information
#
# Table name: assets
#
#  id            :integer          not null, primary key
#  viewable_id   :integer
#  viewable_type :string
#  file          :string
#  type          :string
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Asset < ActiveRecord::Base
  belongs_to :viewable, polymorphic: true
end
