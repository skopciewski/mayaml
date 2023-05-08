# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_accounts/handler"

module Mayaml
  module MuttAccounts
    STRUCTURE = {
      mutt_accounts_handler: proc do
        Handler.new(
          logger: logger.child(component: "mutt_accounts_handler")
        )
      end
    }.freeze
  end
end

Mayaml::Base.set Mayaml::MuttAccounts::STRUCTURE
