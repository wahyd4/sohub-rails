class CreateUserToSohubModules < ActiveRecord::Migration
  def change
    create_table :user_to_sohub_modules do |t|
      t.integer :user_id
      t.integer :sohub_module_id

      t.timestamps
    end
  end
end
