class Group < ApplicationRecord
  has_many :users, through: :group_memberships
end
