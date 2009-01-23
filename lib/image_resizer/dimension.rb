module ImageResizer
  class Dimension
  
    attr_reader :width, :height
  
    def initialize(width, height)
      @width, @height = width, height
    end
  
    def geometry
      "#{width}x#{height}"
    end
  
    def ==(other)
      return false unless other.is_a?(Dimension)
      return false unless other.width == width
      return false unless other.height == height

      return true
    end
  
    def eql?(other)
      self == other
    end
  
  end
end