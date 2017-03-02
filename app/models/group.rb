class Group < ApplicationRecord
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships
  has_one :conversation_history, dependent: :destroy
  has_attachment :photo
end
