class AddTemplateQuestionIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :template_question, foreign_key: true
  end
end
