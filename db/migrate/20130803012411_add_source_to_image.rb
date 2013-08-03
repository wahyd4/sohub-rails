class AddSourceToImage < ActiveRecord::Migration
  def change

    add_attachment :images, :source
  end
end
