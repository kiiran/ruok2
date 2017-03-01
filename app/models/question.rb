class Question < ApplicationRecord
# subjects = [
#   "generic first question",
#   "generic second question",
#   "generic third question"
# ]

  belongs_to :conversation_history
  has_one :answer, dependent: :destroy


  def self.first_question
    questions = [
        "How are you today?",
        "What are you up to?",
        "How are you feeling?",
        "What's on your mind?"
      ]
    Question.new(content: questions.sample)
  end

  def self.sample_of_subject(subject)
    Question.where(subject: subject).sample
  end
end

