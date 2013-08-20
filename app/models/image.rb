require "open-uri"

class Image < ActiveRecord::Base

  belongs_to :user
  belongs_to :message

  has_attached_file :source, styles: {
      thumb: '100x100>',
      medium: '300x300>'
  }

  def store_from_url(url)
    self.source = open(url)
  end

  def self.store_image(url)
    image = Image.new
    image.store_from_url url
    image.save
    image
  end
end
