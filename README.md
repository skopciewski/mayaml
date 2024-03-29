# MAYaml

[![Gem Version](https://badge.fury.io/rb/mayaml.svg)](http://badge.fury.io/rb/mayaml)

This is a package for generating mutt configuration based on the yaml config. The idea is to store mail accounts configuration in one Yaml file and then generates dedicated mutt environment to handle them.

## Installation

Add this line to your application's Gemfile:

    gem 'mayaml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mayaml

## Usage

If ruby bin dir is in your PATH, just call `mayaml-mutt-init <path_to_the_yaml_file> <mutt_config_dir>`.

Or

```ruby
require "mayaml"

Mayaml.accounts_from_file(yaml_path).each { |account| ... }
```

### Mail account format in Yaml file

```yaml
- name: account_name
  default: false
  realname: Jon Foo
  type: imap
  server: test.mailserver.com
  port: 998
  user: user@mailserver.com
  pass: sercet_password
  mailboxes:
    - INBOX
  smtp_protocol: smtps
  smtp_port: 587
  smtp_authenticator: login
  smtp_server: test.mailserver.com
```

#### Required attributes

* `name`
* `realname`
* `type` [imap | imapssl | pop3 | pop3ssl]
* `server`
* `port`
* `user`
* `pass`
* `smtp_protocol` [smpt | smtps]
* `smtp_port`
* `smtp_authenticator`
* `smtp_server`

#### Default attributes

* `mailboxes` => `[]`
* `default` => `false`

## Versioning

See [semver.org][semver]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[semver]: http://semver.org/
