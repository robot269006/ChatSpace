class RemoveColFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :group_user_id
  end
end
