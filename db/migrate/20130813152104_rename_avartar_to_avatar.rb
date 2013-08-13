class RenameAvartarToAvatar < ActiveRecord::Migration
  def change
    rename_column :users, :avartar, :avatar
  end
end
