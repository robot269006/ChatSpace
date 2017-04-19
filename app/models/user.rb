class User < ApplicationRecord
  has_many :groups, through: :group_user
  has_many :group_users

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
