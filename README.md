# RSpec::LegacyFormatters

This gem provides support for using legacy formatters (that is, those
that were written against the RSpec 2 formatter API) with RSpec 3.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-legacy_formatters'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rspec-legacy_formatters

## Usage

This gem MUST be required before the legacy formatter is loaded. We recommend
you use RSpec's `--require` option, either from the command line:

```
$ rspec --require rspec/legacy_formatters --format MyCustomFormatter
```

...or by adding it to `.rspec`:

```
--require rspec/legacy_formatters
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/rspec-legacy_formatters/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
