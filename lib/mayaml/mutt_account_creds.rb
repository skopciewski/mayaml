# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_account_creds/generator"
require "mayaml/mutt_account_creds/presenter"
require "mayaml/mutt_account_creds/validator"

module Mayaml
  module MuttAccountCreds
    STRUCTURE = {
      mutt_account_creds_generator: proc do
        Generator.new(
          logger: logger.child(component: "mutt_account_creds_generator"),
          presenter: mutt_account_creds_presenter,
          validator: mutt_account_creds_validator
        )
      end,
      mutt_account_creds_validator: proc do
        Validator.new(
          logger: logger.child(component: "mutt_account_creds_validator")
        )
      end,
      mutt_account_creds_presenter: proc do
        Presenter.new(
          logger: logger.child(component: "mutt_account_creds_presenter")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
