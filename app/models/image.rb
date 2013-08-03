class Image < ActiveRecord::Base


  has_attached_file :source, styles: {
      thumb: '100x100>',
      medium: '300x300>'
  }
end
