class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.string :content
      t.float :sentiment_analysis

      t.timestamps
    end
  end
end
