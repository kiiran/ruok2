class AddPosToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :pos, :float
    add_column :answers, :neutral, :float
    add_column :answers, :neg, :float
  end
end
