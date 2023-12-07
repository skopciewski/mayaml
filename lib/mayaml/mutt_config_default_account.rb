# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_configs_default_account/handler"

module Mayaml
  module MuttConfigsDefaultAccount
    STRUCTURE = {
      mutt_configs_default_account_handler: proc do
        Handler.new(
          logger: logger.child(component: "mutt_configs_default_account_handler")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
