class AddUserIdToTasks < ActiveRecord::Migration[7.2]
  def change
    add_column :tasks, :user_id, :integer
    add_foreign_key :tasks, :users, column: :user_id
  end
end
