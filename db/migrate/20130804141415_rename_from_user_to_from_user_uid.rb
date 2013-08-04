class RenameFromUserToFromUserUid < ActiveRecord::Migration
  def change
    rename_column :messages, :from_user, :from_user_uid
  end
end
