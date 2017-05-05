class AddIndexToMessages < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :users_id, :user_id
    rename_column :messages, :groups_id, :group_id
    add_index :messages, [:user_id, :group_id]
  end
end
