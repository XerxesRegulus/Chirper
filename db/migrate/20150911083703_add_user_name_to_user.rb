class AddUserNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :follower_id, :string
  end
end
