class RemoveColFromGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :group_user_id
  end
end
