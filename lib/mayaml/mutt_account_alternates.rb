# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_account_alternates/generator"
require "mayaml/mutt_account_alternates/presenter"
require "mayaml/mutt_account_alternates/validator"

module Mayaml
  module MuttAccountAlternates
    STRUCTURE = {
      mutt_account_alternates_generator: proc do
        Generator.new(
          logger: logger.child(component: "mutt_account_alternates_generator"),
          presenter: mutt_account_alternates_presenter,
          validator: mutt_account_alternates_validator
        )
      end,
      mutt_account_alternates_validator: proc do
        Validator.new(
          logger: logger.child(component: "mutt_account_alternates_validator")
        )
      end,
      mutt_account_alternates_presenter: proc do
        Presenter.new(
          logger: logger.child(component: "mutt_account_alternates_presenter")
        )
      end
    }.freeze
  end
end

Mayaml::Base.set Mayaml::MuttAccountAlternates::STRUCTURE
