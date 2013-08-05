class AddFromUserToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :from_user, :integer, limit: 8
  end
end
