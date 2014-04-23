require 'rspec/support/spec'
RSpec::Support::Spec.setup_simplecov

Dir['./spec/support/**/*.rb'].map { |f| require f }
