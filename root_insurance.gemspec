# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "root_insurance/version"

Gem::Specification.new do |spec|
  spec.name          = "root_insurance"
  spec.version       = RootInsurance::VERSION
  spec.authors       = ["Root Wealth"]
  spec.email         = ["hello@root.co.za"]

  spec.summary       = "Root Insurance API client"
  spec.description   = "Root Insurance API client"
  spec.homepage      = "https://github.com/root-community/root-insurance-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty'
  spec.add_dependency 'mimemagic'
  spec.add_development_dependency "semvergen", "~> 1.9"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.1.0"
end
