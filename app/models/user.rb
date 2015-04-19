# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  username               :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :validatable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_one :profile
  delegate :nickname, to: :profile
  has_many :apartments, foreign_key: :landlord_id
  has_many :tenant_rent_cases, foreign_key: :owner_id
  has_many :landlord_rent_cases, foreign_key: :owner_id
  has_many :user_group_ships
  has_many :groups, through: :user_group_ships

  validates_presence_of :email, :username, :password, :password_confirmation

  attr_accessor :password_confirmation

  def can_join?(group)
    true if user_group_ships.find_by(group: group).nil? && self != group.organizer
  end

  def can_approve_join_request?(group)
    true if self == group.organizer
  end

end
