class RemoveSentimentAnalysisFromAnswers < ActiveRecord::Migration[5.0]
  def change
    remove_column :answers, :sentiment_analysis, :float
  end
end
