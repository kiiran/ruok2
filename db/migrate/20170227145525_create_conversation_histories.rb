class CreateConversationHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :conversation_histories do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.float :positive_index
      t.float :negative_index

      t.timestamps
    end
  end
end
