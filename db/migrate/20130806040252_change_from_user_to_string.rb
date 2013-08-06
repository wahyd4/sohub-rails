class ChangeFromUserToString < ActiveRecord::Migration
  def change
    change_column :messages, :from_user, :string
  end


end
