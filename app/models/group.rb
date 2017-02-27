class Group < ApplicationRecord
  belongs_to :user
  has_many :users, through: :group_memberships
end
