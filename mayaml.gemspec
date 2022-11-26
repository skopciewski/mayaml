# frozen_string_literal: true

begin
  require "./lib/mayaml/version"
rescue LoadError
  module Mayaml; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name = "mayaml"
  spec.version = Mayaml::VERSION
  spec.authors = ["Szymon Kopciewski"]
  spec.email = ["s.kopciewski@dlamnie.net"]
  spec.summary = "Mail Accounts from Yaml parser"
  spec.description = "Mail Accounts from Yaml parser"
  spec.homepage = "https://github.com/skopciewski/mayaml"
  spec.license = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files = Dir.glob("{bin,lib}/**/*") + \
    %w[Gemfile LICENSE README.md CHANGELOG.md]
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }

  spec.add_runtime_dependency "mainapp", "~>1"
  spec.add_runtime_dependency "mustache", "~>1"
  spec.add_runtime_dependency "ougai"

  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "solargraph"
end
