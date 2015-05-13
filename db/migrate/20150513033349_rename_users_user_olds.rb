class RenameUsersUserOlds < ActiveRecord::Migration
  def change
    rename_table :users, :user_olds
  end
end
