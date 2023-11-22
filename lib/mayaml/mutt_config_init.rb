# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_configs_init/handler"

module Mayaml
  module MuttConfigsInit
    STRUCTURE = {
      default_init_file: ENV["MAYAML_DEF_INIT_FILE"] || "init.muttrc",
      mutt_configs_init_handler: proc do
        Handler.new(
          mutt_account_init_generator: mutt_account_init_generator,
          mutt_account_alternates_generator: mutt_account_alternates_generator,
          default_init_file: default_init_file,
          logger: logger.child(component: "mutt_configs_init_handler")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
