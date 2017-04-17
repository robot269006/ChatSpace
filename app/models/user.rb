class User < ApplicationRecord
  has_many :groups, through: :group_user
  has_many :group_users
  accepts_nested_attributes_for :groups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
