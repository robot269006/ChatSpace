class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text        :name, null: false
      t.text        :body
      t.text        :email, null: false
      t.text        :password, null:false
      # t.integer     :group_id
      t.timestamps
    end
  end
end
