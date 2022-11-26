# frozen_string_literal: true

require "mainapp/base"
require "ougai"

lib_dir = File.expand_path(".", __dir__)
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)
Dir[File.join(lib_dir, "mayaml", "*.rb")].each { |path| require_relative path }
