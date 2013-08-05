# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stricter_string_to_date/version'

Gem::Specification.new do |spec|
  spec.name          = "stricter-string-to-date"
  spec.version       = StricterStringToDate::VERSION
  spec.authors       = ["Jeff Dean"]
  spec.email         = ["jeff@zilkey.com"]
  spec.description   = %q{Restores ActiveSupport 3.x String#to_date functionality}
  spec.summary       = %q{Restores ActiveSupport 3.x String#to_date functionality}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "activesupport", "~> 4.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
