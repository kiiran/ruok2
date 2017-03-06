class TemplateQuestion < ApplicationRecord

  has_many :questions

  def self.first_question
    template_questions = [
        "How are you today?",
        "Tell me about your day",
        "How are you feeling?",
        "What's on your mind?"
      ]
    # Just "Question" because it will have the TQ_id
    Question.new(content: template_questions.sample)
  end

  def self.sample_of_question_type(question_type)
    TemplateQuestion.where(question_type: question_type).sample
  end
end

