# coding: utf-8

begin
  require "./lib/mayaml/version"
rescue LoadError
  module Mayaml; VERSION = "0".freeze; end
end

Gem::Specification.new do |spec|
  spec.name          = "mayaml"
  spec.version       = Mayaml::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = ["s.kopciewski@gmail.com"]
  spec.summary       = "Mail Accounts from Json parser - the base classes"
  spec.description   = "Mail Accounts from Json parser - the base classes"
  spec.homepage      = "https://github.com/skopciewski/mayaml"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files         = Dir.glob("{bin,lib}/**/*") + \
                       %w(Gemfile LICENSE README.md CHANGELOG.md)
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_runtime_dependency 'json'
end
