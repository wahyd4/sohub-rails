class AddHubIdToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :hub_id, :integer
  end
end
