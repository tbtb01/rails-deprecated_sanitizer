# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/deprecated_sanitizer/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-deprecated_sanitizer"
  spec.version       = Rails::DeprecatedSanitizer::VERSION
  spec.authors       = ["Kasper Timm Hansen"]
  spec.email         = ["kaspth@gmail.com"]
  spec.summary       = %q{Deprecated sanitizer API extracted from Action View.}
  spec.homepage      = "https://github.com/rails/rails-deprecated_sanitizer"
  spec.license       = "MIT"

  spec.files         = Dir["CHANGELOG.md", "LICENSE", "README.md", "lib/**/*"]
  spec.test_files    = Dir["test/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 4.2.0.alpha"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
