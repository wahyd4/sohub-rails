class RenameFromUserToFromUserId < ActiveRecord::Migration
  def change
    rename_column :messages, :from_user_uid, :user_id
  end
end
