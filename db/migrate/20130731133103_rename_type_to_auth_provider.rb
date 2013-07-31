class RenameTypeToAuthProvider < ActiveRecord::Migration
  def change
    rename_column :credentials, :type, :oauth_provider
  end
end
