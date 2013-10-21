class CreateSohubModules < ActiveRecord::Migration
  def change
    create_table :sohub_modules do |t|
      t.string :name
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
