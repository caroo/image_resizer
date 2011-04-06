require 'test_helper'

class ResizeGeneratorTest < Test::Unit::TestCase
  
  def test_should_generate_thumbnail
    image = mock("MockImage")
    magick_image = mock("MockMagicImage")
    thumbnail = mock("ThumbnailMock")
    image_data = StringIO.new("image data string")
    image.expects(:image_data).at_least_once.returns(image_data)
    dimension = ImageResizer::Dimension.new(300,225)
    image.stubs(:dimension).returns(dimension)
    Magick::Image.expects(:from_blob).with(image_data.read).returns([magick_image])
    magick_image.expects(:change_geometry).with(dimension.geometry).returns(thumbnail)
    smaller_image = String.new("smaller image")
    thumbnail.expects(:to_blob).returns(smaller_image)
    StringIO.expects(:new).with(smaller_image).returns(smaller_image)
    image.expects(:image_data=).with(smaller_image)
    ImageResizer::ResizeGenerator.resize(image)
  end

  def test_should_not_generate_thumbnail_if_the_image_has_no_dimension
    image = mock("MockImage")
    image.expects(:image_data).returns(stub(:rewind => true))
    image.stubs(:dimension)
    Magick::Image.expects(:from_blob).never

    assert_equal image, ImageResizer::ResizeGenerator.resize(image)
  end
end
