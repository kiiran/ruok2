class AddTypeToTemplateQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :template_questions, :question_type, :string
  end
end
