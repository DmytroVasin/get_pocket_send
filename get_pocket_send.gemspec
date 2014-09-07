# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'get_pocket_send/version'

Gem::Specification.new do |spec|
  spec.name          = "get_pocket_send"
  spec.version       = GetPocketSend::VERSION
  spec.authors       = ["Vasin Dmitriy"]
  spec.email         = ["vasindima779@gmail.com"]
  spec.summary       = "This is a small aplication for turn get pocket from terminal"
  spec.homepage      = "https://github.com/demitriydn/..."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["get_pocket_send"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri', ['1.6.1']

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
