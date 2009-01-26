# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{image_resizer}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Caroo GmbH"]
  s.date = %q{2009-01-26}
  s.description = %q{}
  s.email = ["dev@pkw.de"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["COPYING", "History.txt", "MIT-LICENSE", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "image_resizer.gemspec", "lib/image_resizer.rb", "lib/image_resizer/default_resizer.rb", "lib/image_resizer/dimension.rb", "lib/image_resizer/resize_generator.rb", "test/default_resizer_test.rb", "test/dimension_test.rb", "test/resize_generator_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{ImageResizer is an Interface which defines how to call thumbnail-generators. We provide different ImageResizers which use RMagick.}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{image_resizer}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{ImageResizer is an Interface which defines how to call thumbnail-generators.}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rmagick>, [">= 0"])
      s.add_runtime_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<rmagick>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<rmagick>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
