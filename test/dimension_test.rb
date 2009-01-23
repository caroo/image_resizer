require File.dirname(__FILE__) + '/test_helper'

class DimensionTest < Test::Unit::TestCase
  
  def test_should_initialize_with_width_and_height
    assert dimension = ImageResizer::Dimension.new(640, 480)
    assert_equal 640, dimension.width
    assert_equal 480, dimension.height
  end
  
  def test_should_have_a_geometry_string
    dimension = ImageResizer::Dimension.new(640, 480)
    assert_equal "640x480", dimension.geometry
  end
  
  def test_should_have_equals_method
    dimension1 = ImageResizer::Dimension.new(640, 480)
    dimension2 = ImageResizer::Dimension.new(640, 480)
    assert_equal dimension1, dimension2

    dimension1 = ImageResizer::Dimension.new(640, 480)
    dimension2 = ImageResizer::Dimension.new(480, 640)
    assert_not_equal dimension1, dimension2

    dimension = ImageResizer::Dimension.new(640, 480)
    assert_not_equal dimension, "Dimension"
  end
  
end