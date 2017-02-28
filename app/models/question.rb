class Question < ApplicationRecord
  belongs_to :conversation_history
  has_one :answer

  def self.first_question
    questions = [
      "How are you today?",
      "What are you up to?",
      "How are you feeling?",
      "What's on your mind?"
    ]
    questions.sample
  end
end
