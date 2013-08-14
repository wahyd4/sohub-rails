class CreateHubs < ActiveRecord::Migration
  def change
    create_table :hubs do |t|
      t.string :name
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
