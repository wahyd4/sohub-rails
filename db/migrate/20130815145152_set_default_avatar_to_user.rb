class SetDefaultAvatarToUser < ActiveRecord::Migration
  def change
    change_column :users, :avatar, :string, default: '/assets/elephant.jpg'
  end
end
