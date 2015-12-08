require 'rspec/support/spec'

require 'rspec/core/formatters/console_codes'

# This MUST be loaded early, before rspec-core's formatters are loaded.
require 'rspec/legacy_formatters'

Dir['../spec/support/**/*.rb'].map { |f| require f }
