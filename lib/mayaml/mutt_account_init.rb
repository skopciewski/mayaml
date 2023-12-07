# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_account_init/generator"
require "mayaml/mutt_account_init/presenter"
require "mayaml/mutt_account_init/validator"

module Mayaml
  module MuttAccountInit
    STRUCTURE = {
      mutt_account_init_generator: proc do
        Generator.new(
          logger: logger.child(component: "mutt_account_init_generator"),
          presenter: mutt_account_init_presenter,
          validator: mutt_account_init_validator
        )
      end,
      mutt_account_init_validator: proc do
        Validator.new(
          logger: logger.child(component: "mutt_account_init_validator")
        )
      end,
      mutt_account_init_presenter: proc do
        Presenter.new(
          logger: logger.child(component: "mutt_account_init_presenter")
        )
      end
    }.freeze

    ::Mayaml::Base.set STRUCTURE
  end
end
