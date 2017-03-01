class AddAdminToGroupMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :group_memberships, :admin, :boolean, default: false, null: false
  end
end
