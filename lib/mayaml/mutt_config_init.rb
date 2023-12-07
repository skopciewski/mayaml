# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_configs_init/handler"

module Mayaml
  module MuttConfigsInit
    STRUCTURE = {
      mutt_configs_init_handler: proc do
        Handler.new(
          mutt_account_init_generator: mutt_account_init_generator,
          mutt_account_alternates_generator: mutt_account_alternates_generator,
          logger: logger.child(component: "mutt_configs_init_handler")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
