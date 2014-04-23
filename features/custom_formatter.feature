Feature: Custom formatters

  Scenario: a legacy custom formatter
    Given a file named "custom_formatter.rb" with:
      """ruby
      require "rspec/legacy_formatters"
      require "rspec/core/formatters/base_text_formatter"

      class CustomFormatter < RSpec::Core::Formatters::BaseTextFormatter
        def initialize(output)
          super(output)
        end

        def example_started(proxy)
          output << "example: " << proxy.description
        end
      end
      """
    And a file named "example_spec.rb" with:
      """ruby
      describe "my group" do
        specify "my example" do
        end
      end
      """
    When I run `rspec example_spec.rb --require ./custom_formatter.rb --format CustomFormatter`
    Then the output should contain "example: my example"
    And  the exit status should be 0
