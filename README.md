# MAYaml

[![Gem Version](https://badge.fury.io/rb/mayaml.svg)](http://badge.fury.io/rb/mayaml)

This is a base package for mail accounts configuration generators. The idea is to store mail accounts configuration in one Yaml file and then generates dedicated configs for specific programs (like getmail, mutt, etc...).

## Installation

Add this line to your application's Gemfile:

    gem 'mayaml'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mayaml

## Usage

If ruby bin dir is in your PATH, just call `mayaml-check <path_to_the_yaml_file>` to list recognized accounts.
On the other hand, In plugins:

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
```

#### Required attributes

* `name`
* `type`
* `server`
* `port`
* `user`
* `pass`
* `realname`

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
