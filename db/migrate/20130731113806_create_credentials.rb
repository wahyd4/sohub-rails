class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :type
      t.string :token
      t.string :fresh_token

      t.timestamps
    end
  end
end
