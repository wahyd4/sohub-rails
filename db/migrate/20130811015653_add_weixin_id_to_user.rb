class AddWeixinIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :weixin_user_id, :string
  end
end
