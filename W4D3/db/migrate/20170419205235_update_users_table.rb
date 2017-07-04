class UpdateUsersTable < ActiveRecord::Migration
  def change
    remove_column :users, :username
    add_column :users, :user_name, :string
  end
end
