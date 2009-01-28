%w[rubygems rake rake/clean fileutils newgem rubigen].each { |f| require f }
require File.dirname(__FILE__) + '/lib/image_resizer'

$hoe = Hoe.new('image_resizer', ImageResizer::VERSION) do |p|
  p.developer('Caroo GmbH', 'dev@pkw.de')
  p.post_install_message = File.read('PostInstall.txt')
  p.changes              = p.paragraphs_of("History.txt", 0..1).join("\n\n")
  p.extra_deps = ['rmagick'],
  p.extra_dev_deps = [
    ['mocha'],
    # ['newgem']
  ]
  p.summary = "ImageResizer is an Interface which defines how to call thumbnail-generators."
  p.clean_globs |= %w[**/.DS_Store tmp *.log]
end

require 'newgem/tasks'

desc "Run unit tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
  t.warning = true
end

desc 'Generate RDoc'
Rake::RDocTask.new do |task|
  task.main = 'README.rdoc'
  task.title = "ImageResizer #{ImageResizer::VERSION}"
  task.rdoc_dir = 'doc'
  task.rdoc_files.include('README.rdoc', 'COPYING', 'MIT-LICENSE', "lib/image_resizer/*.rb")
end