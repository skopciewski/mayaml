# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_configs_static/handler"

module Mayaml
  module MuttConfigsStatic
    STRUCTURE = {
      mutt_configs_static_handler: proc do
        Handler.new(
          logger: logger.child(component: "mutt_configs_static_handler")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
