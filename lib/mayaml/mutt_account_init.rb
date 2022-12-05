# frozen_string_literal: true

require "mayaml/base"
require "mayaml/mutt_account_init/generator"
require "mayaml/mutt_account_init/presenter"

module Mayaml
  module MuttAccountInit
    STRUCTURE = {
      mutt_account_init_generator: proc do
        Generator.new(
          logger: logger.child(component: "mutt_account_init_generator"),
          presenter: mutt_account_init_presenter,
          infrastructure: {accounts_dir: "~/.mutt/accounts"}
        )
      end,
      mutt_account_init_presenter: proc do
        Presenter.new(
          logger: logger.child(component: "mutt_account_init_presenter")
        )
      end
    }.freeze
  end
end

Mayaml::Base.set Mayaml::MuttAccountInit::STRUCTURE
