class CreateTemplateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :template_questions do |t|
      t.string :subject
      t.string :content
    end
  end
end
