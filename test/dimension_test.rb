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

  def test_should_be_comparable_to_each_other
    dimension1 = ImageResizer::Dimension.new(640, 480)
    dimension2 = ImageResizer::Dimension.new(640, 480)
    assert_equal 0, (dimension1 <=> dimension2)

    dimension1 = ImageResizer::Dimension.new(640, 480)
    dimension2 = ImageResizer::Dimension.new(320, 240)
    assert_equal 1, (dimension1 <=> dimension2)

    dimension1 = ImageResizer::Dimension.new(320, 240)
    dimension2 = ImageResizer::Dimension.new(640, 480)
    assert_equal -1, (dimension1 <=> dimension2)
  end

  def test_equality
    d1 = ImageResizer::Dimension.new(100, 50)
    d2 = ImageResizer::Dimension.new(100, 50)
    d3 = ImageResizer::Dimension.new(101, 50)
    d4 = ImageResizer::Dimension.new(100, 51)
    assert_equal d1, d2
    assert d1.eql?(d2)
    assert_not_equal d2, d3
    assert_false d2.eql?(d3)
    assert_not_equal d2, d4
    assert_false d2.eql?(d4)
    assert_not_equal d3, d4
    assert_false d3.eql?(d4)
  end
end
