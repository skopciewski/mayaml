# frozen_string_literal: true

require "mainapp/base"
require "ougai"

module Mayaml
  class Base
    extend ::Mainapp::Base
  end

  STRUCTURE = {
    logger: Ougai::Logger.new($stdout).tap do |logger|
      logger.level = Kernel.const_get(ENV["LOG_LEVEL"] || "Logger::INFO")
      logger.with_fields = {name: "mayaml"}
    end
  }.freeze

  ::Mayaml::Base.set Mayaml::STRUCTURE
end
