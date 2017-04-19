class RemoveColFromGroupuser < ActiveRecord::Migration[5.0]
  def change
    remove_column :group_users, :group_id_id
    remove_column :group_users, :user_id_id
  end
end
