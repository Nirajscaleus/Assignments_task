class RemovePasswordConfirmFromUsers < ActiveRecord::Migration[7.2]
  def change
    remove_column :users, :password_confirm
  end
end
