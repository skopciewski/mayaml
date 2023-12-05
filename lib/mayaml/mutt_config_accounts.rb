# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_configs_accounts/handler"

module Mayaml
  module MuttConfigsAccounts
    STRUCTURE = {
      mutt_configs_accounts_handler: proc do
        Handler.new(
          mutt_account_creds_generator: mutt_account_creds_generator,
          default_accounts_dir: default_accounts_dir,
          logger: logger.child(component: "mutt_configs_accounts_handler")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
