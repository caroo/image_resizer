require "RMagick"

module ImageResizer
  class ResizeGenerator
  
    FORMAT = "jpg"
  
    def self.resize(image)
      image.image_data.rewind

      if image.dimension
        magick_image     = Magick::Image.from_blob(image.image_data.read).first
        thumbnail        = magick_image.change_geometry(image.dimension.geometry) { |cols, rows, img| img.thumbnail(cols, rows) }
        image.image_data = StringIO.new(thumbnail.to_blob { |img| img.format = FORMAT } )
      end

      return image
    end

  end
end
