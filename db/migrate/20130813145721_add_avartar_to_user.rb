class AddAvartarToUser < ActiveRecord::Migration
  def change
    add_column :users, :avartar, :string
  end
end
