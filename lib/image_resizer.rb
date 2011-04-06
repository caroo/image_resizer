$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))
  
require 'image_resizer/dimension'
require 'image_resizer/resize_generator'
require 'image_resizer/default_resizer'

module ImageResizer
  VERSION = '0.3.0'
end
