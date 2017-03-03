class AddLabelToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :label, :string
  end
end
