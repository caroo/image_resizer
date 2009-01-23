module ImageResizer
  class DefaultResizer
  
    FORMAT = "jpg"
  
    def self.resize(image)
      image.image_data.rewind
      magick_image = Magick::Image.from_blob(image.image_data.read).first
      thumbnail = magick_image.change_geometry(image.dimension.geometry) { |cols, rows, img| img.thumbnail(cols, rows) }
      thumbnail.border!(150,150,"#ffffff")
      thumbnail.crop!(Magick::CenterGravity,image.dimension.width,image.dimension.height)
      image.image_data = StringIO.new(thumbnail.to_blob{|i| i.format = FORMAT})
      return image
    end
    
  end
end
