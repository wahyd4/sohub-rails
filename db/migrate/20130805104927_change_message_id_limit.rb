class ChangeMessageIdLimit < ActiveRecord::Migration
  def change
    change_column :messages, :message_id, :integer, limit: 8
  end
end
