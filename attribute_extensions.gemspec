# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'attribute_extensions/version'

Gem::Specification.new do |gem|
  gem.name          = "attribute_extensions"
  gem.version       = AttributeExtensions::VERSION
  gem.authors       = ["Delwyn de Villiers"]
  gem.email         = ["delwyn.d@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activesupport', '~> 3.2.0'

  gem.add_development_dependency 'rspec', '~> 2.12.0'
end
