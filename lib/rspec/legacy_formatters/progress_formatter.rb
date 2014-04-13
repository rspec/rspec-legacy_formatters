require 'rspec/legacy_formatters/base_text_formatter'
module RSpec
  module Core
    module Formatters

      if defined?(ProgressFormatter)
        remove_const :ProgressFormatter
      end

      class ProgressFormatter < BaseTextFormatter

        def example_passed(example)
          super(example)
          output.print success_color('.')
        end

        def example_pending(example)
          super(example)
          output.print pending_color('*')
        end

        def example_failed(example)
          super(example)
          output.print failure_color('F')
        end

        def start_dump
          super()
          output.puts
        end

      end

    end
  end
end
