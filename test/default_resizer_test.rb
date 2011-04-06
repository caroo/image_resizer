require "test_helper"

class DefaultResizerTest < Test::Unit::TestCase
  
  def test_should_resize_image_with_boarder_and_cropping
    image = mock("MockImage")
    magick_image = mock("MockMagicImage")
    thumbnail = mock("ThumbnailMock")
    image_data = StringIO.new("image data string")
    image.expects(:image_data).at_least_once.returns(image_data)
    dimension = ImageResizer::Dimension.new(300,225)
    image.stubs(:dimension).returns(dimension)
    Magick::Image.expects(:from_blob).with(image_data.read).returns([magick_image])
    magick_image.expects(:change_geometry).with(dimension.geometry).returns(thumbnail)
    thumbnail.expects(:border!).with(150,150,"#ffffff")
    thumbnail.expects(:crop!)
    smaller_image = String.new("smaller image")
    thumbnail.expects(:to_blob).returns(smaller_image)
    StringIO.expects(:new).with(smaller_image).returns(smaller_image)
    image.expects(:image_data=).with(smaller_image)
    ImageResizer::DefaultResizer.resize(image)
  end
  
end
