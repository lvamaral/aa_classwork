class UpdateUserNameColumn < ActiveRecord::Migration
  def change
    remove_column :users, :user_name
    add_column :users, :user_name, :string, null: false
  end
end
