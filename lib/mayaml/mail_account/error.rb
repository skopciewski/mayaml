# frozen_string_literal: true

require "mayaml/error"

module Mayaml
  class MailAccount
    class Error < ::Mayaml::Error
    end

    class MissingAttributes < Error
    end

    class WrongDefaultFlag < Error
    end

    class WrongAccountType < Error
    end

    class WrongAccountPort < Error
    end

    class WrongAccountMailboxes < Error
    end

    class WrongAccountSmtpPort < Error
    end

    class WrongAccountSmtpProtocol < Error
    end
  end
end
