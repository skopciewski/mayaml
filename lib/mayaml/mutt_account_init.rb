# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_account_init/generator"

module Mayaml
  module MuttAccountInit
    STRUCTURE = {
      mutt_account_init_generator: proc do
        Generator.new(
          logger: logger
        )
      end
    }.freeze
  end
end

Mayaml::Base.set Mayaml::MuttAccountInit::STRUCTURE
