class ChangeCreateTimeTypeToInteger < ActiveRecord::Migration
  def change
    change_column :messages, :create_time, :integer, limit: 8
  end
end
