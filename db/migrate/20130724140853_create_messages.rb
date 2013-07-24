class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :to_user
      t.string :from_user
      t.datetime :create_time
      t.string :message_type
      t.text :content
      t.integer :message_id
      t.string :picture_url

      t.timestamps
    end
  end
end
