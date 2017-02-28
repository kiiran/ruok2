class RemoveAdminIdFromGroups < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :admin_id
    remove_column :groups, :user_id
    add_column :groups, :name, :string
  end
end
