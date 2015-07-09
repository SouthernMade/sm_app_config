# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sm_app_config/version'

Gem::Specification.new do |spec|
  spec.name          = "sm_app_config"
  spec.version       = SmAppConfig::VERSION
  spec.authors       = ["Jack Whitis", "Matt Mueller"]
  spec.email         = ["jack@southernmade.co"]

  spec.summary       = %q{Application configuration for multiple environments.}
  spec.description   = %q{Library for managing application configuration using a YAML file or ENV variables.}
  spec.homepage      = "https://github.com/SouthernMade/sm_app_config"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.post_install_message = "Run `thor app_config:install` to complete installation."

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "thor"
end
