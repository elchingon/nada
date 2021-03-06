# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nada/version'

Gem::Specification.new do |spec|
  spec.name          = "nada"
  spec.version       = Nada::VERSION
  spec.authors       = ["Aaron Renner"]
  spec.email         = ["aaron@animascodelabs.com"]
  spec.description   = %q{Client for interacting with NADA web services}
  spec.summary       = %q{Client for interacting with NADA web services}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client", "~> 1.6.3"
  spec.add_dependency "virtus", "~> 1.0.1"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.0"
  spec.add_development_dependency "dotenv", "~> 0.9.0"
  spec.add_development_dependency "pry"
end
