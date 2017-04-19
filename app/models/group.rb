class Group < ApplicationRecord
  has_many :users, through: :group_user
  has_many :group_users
  accepts_nested_attributes_for :users
end
