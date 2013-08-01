class RenameFreshTokenToRefreshToken < ActiveRecord::Migration
  def change
    rename_column :credentials, :fresh_token, :refresh_token
  end
end
