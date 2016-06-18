# coding: utf-8

begin
  require "./lib/majson/version"
rescue LoadError
  module Majson; VERSION = "0".freeze; end
end

Gem::Specification.new do |spec|
  spec.name          = "majson"
  spec.version       = Majson::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = ["s.kopciewski@gmail.com"]
  spec.summary       = "Mail Accounts from Json parser - the base classes"
  spec.description   = "Mail Accounts from Json parser - the base classes"
  spec.homepage      = "https://github.com/skopciewski/majson"
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
end
