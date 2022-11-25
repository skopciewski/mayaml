# frozen_string_literal: true

module Mayaml
  class MailAccount
    attr_accessor :name, :default, :realname, :type, :server, :port, :user, :pass, \
      :mailboxes, :smtp_protocol, :smtp_port, :smtp_authenticator, :smtp_server

    def initialize
      set_default_flag
      set_default_mailboxes
    end

    def set_default_flag
      @default = false
    end

    def set_default_mailboxes
      @mailboxes = []
    end

    def to_str
      default_mark = @default ? "*" : ""
      <<-DESC
        Account#{default_mark}: #{@name}<#{@realname}> | user: #{@user}:#{@pass}
          #{@type} - #{@server}:#{@port} [#{@mailboxes.join(",")}]
          #{@smtp_protocol} - #{@smtp_server}:#{@smtp_port} [auth: #{@smtp_authenticator}]
      DESC
    end
  end
end
