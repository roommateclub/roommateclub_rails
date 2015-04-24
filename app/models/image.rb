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

class Image < Asset
  mount_uploader :file, ImageUploader
  belongs_to :apartment
end
