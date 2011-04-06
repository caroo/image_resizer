module ImageResizer
  class Dimension
    include Comparable
  
    attr_reader :width, :height
  
    def initialize(width, height)
      @width, @height = width, height
    end
  
    def geometry
      "#{@width}x#{@height}"
    end

    def <=>(other)
      area <=> other.area
    end

    def ==(other)
      Dimension === other && other.width == @width && other.height == @height
    end

    def area
      @width * @height
    end
  
    def eql?(other)
      self == other
    end
  end
end
