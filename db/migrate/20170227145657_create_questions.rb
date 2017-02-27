class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :conversation_history, foreign_key: true
      t.string :subject
      t.string :content

      t.timestamps
    end
  end
end
