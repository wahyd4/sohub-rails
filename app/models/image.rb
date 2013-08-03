require "open-uri"

class Image < ActiveRecord::Base

  has_attached_file :source, styles: {
      thumb: '100x100>',
      medium: '300x300>'
  }

  def store_from_url(url)
    self.source = open(url)
  end
end
