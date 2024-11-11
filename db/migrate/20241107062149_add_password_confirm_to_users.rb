class AddPasswordConfirmToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :password_confirm, :string
  end
end
