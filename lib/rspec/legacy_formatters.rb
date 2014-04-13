require "rspec/legacy_formatters/version"
require "rspec/legacy_formatters/adaptor"
require "rspec/core/formatters/helpers"
require 'stringio'

%w[
  base_formatter
  base_text_formatter
  documentation_formatter
  html_formatter
  json_formatter
  progress_formatter
].each do |formatter|
  require "rspec/legacy_formatters/#{formatter}"
end

# Namespace for the rspec code.
module RSpec
  # Namespace for the rspec-legacy_formatters code.
  module LegacyFormatters

    # Loads legacy formatters into an adaptor.
    #
    # @param formatter_class [Class] a legacy formatter class
    # @param args [Array(IO)] output streams for formatters
    # @return [Adaptor] a legacy formatter adaptor with an initialized legacy formatter
    def self.load_formatter(formatter_class, *args)
      Adaptor.new(formatter_class, *args)
    end

  end
end
