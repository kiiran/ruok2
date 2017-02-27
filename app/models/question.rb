class Question < ApplicationRecord
  belongs_to :conversation_history
  has_one :answer


end
