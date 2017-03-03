class Question < ApplicationRecord

  belongs_to :conversation_history
  has_one :answer, dependent: :destroy
  belongs_to :template_question

  def self.make_from(template_question, convo_history)
    question = Question.new
    question.subject = template_question.subject
    question.content = template_question.content
    question.template_question = template_question
    question.conversation_history = convo_history
    question.save
    question
  end
end

