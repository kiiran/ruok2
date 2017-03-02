class TemplateQuestion < ApplicationRecord
# subjects = [
#   "generic first question",
#   "generic second question",
#   "generic third question"
# ]

  has_many :questions

  def self.first_question
    template_questions = [
        "How are you today?",
        "What are you up to?",
        "How are you feeling?",
        "What's on your mind?"
      ]
    TemplateQuestion.new(content: template_questions.sample)
  end

  def self.sample_of_subject(subject)
    TemplateQuestion.where(subject: subject).sample
  end
end

