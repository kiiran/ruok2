class Group < ApplicationRecord
  validates :name, presence: true
  has_many :group_memberships, dependent: :destroy
  has_many :users, through: :group_memberships
  has_many :conversation_histories, dependent: :destroy
  has_attachment :photo

  def send_questionnaire_to
    UserMailer.send_questionnaire_to(this).deliver_now
    alert('email request sent')
  end
end
