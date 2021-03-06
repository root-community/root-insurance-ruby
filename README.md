# Root Insurance Ruby

[![Build Status](https://travis-ci.org/root-community/root-insurance-ruby.svg?branch=master)](https://travis-ci.org/root-community/root-insurance-ruby)
[![Coverage Status](https://coveralls.io/repos/github/root-community/root-insurance-ruby/badge.svg?branch=master)](https://coveralls.io/github/root-community/root-insurance-ruby?branch=master)
[![Gem Version](https://badge.fury.io/rb/root_insurance.svg)](https://badge.fury.io/rb/root_insurance)

Root is a company built by developers for developers. Open Source Software is part of our culture. We open-source as much of our codebase as we can.

Our SDKs are community maintained. (because we’re not experts in go, or lolcode, or ruby, or swift or rust or any of the plethora of wonderful languages living out in the wild).

This repo for the Ruby Insurance SDK  is currently a simple wrapper around Root's Insurance API. The full API documentation can be found [here](https://app.root.co.za/docs/insurance/api).

For help and support, please reach out to us on the Root Club Slack.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'root_insurance'
```

And then execute:

```bash
bundle
```

## Quick start
1. Create an instance of `RootInsurance::Client`
```ruby
client = RootInsurance::Client.new("test_key_tYILz1640w9q5n5kNQUZ", '', :sandbox)
```

2. Use the api
See the documentation [here](https://www.rubydoc.info/gems/root_insurance/).

## Contributing
If you wish to contribute to this repository, please fork it and send a PR our way.

## Code of Conduct
Root’s developers and our community are expected to abide by the [Contributor Covenant Code of Conduct](https://github.com/root-community/root-insurance-ruby/tree/master/CODE_OF_CONDUCT.md).
Play nice.
