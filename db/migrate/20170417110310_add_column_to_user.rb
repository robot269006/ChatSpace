class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :group_user_id, :integer
  end
end
