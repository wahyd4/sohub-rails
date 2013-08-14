class AddCurrentHubToUser < ActiveRecord::Migration
  def change
    add_column :users, :current_hub_id, :integer
  end
end
