require "rspec/legacy_formatters/version"
require "rspec/legacy_formatters/adaptor"
require 'stringio'

# Require all of rspec-core's formatters (and supporting files).
# We do this so that if a legacy formatter gem requires any of
# these files, it'll be a no-op (as the file will have already
# been required). If we didn't do this, and one of the rspec-core
# formatters got loaded after our definition here, it could stomp
# our definition.
%w[
  base_formatter
  base_text_formatter
  console_codes
  deprecation_formatter
  documentation_formatter
  helpers
  html_formatter
  html_printer
  json_formatter
  progress_formatter
  snippet_extractor
].each do |formatter_file|
  require "rspec/core/formatters/#{formatter_file}"
end

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

  module Core
    # Needed for Fivemat.
    # See https://github.com/rspec/rspec-core/pull/1129
    PendingExampleFixedError = Pending::PendingExampleFixedError
  end
end
