class Question < ApplicationRecord

  belongs_to :conversation_history
  has_one :answer, dependent: :destroy
  belongs_to :template_question


end

