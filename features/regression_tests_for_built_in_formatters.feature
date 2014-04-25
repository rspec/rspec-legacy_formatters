Feature: Regression tests for built in formatters

  Background:
    Given a file named ".rspec" with:
      """
      --require rspec/legacy_formatters
      --require spec_helper
      """
      And a file named "spec/spec_helper.rb" with:
      """
      RSpec.configure do |rspec|
        rspec.raise_errors_for_deprecations!
      end
      """
      And a file named "spec/passing_and_failing_spec.rb" with:
      """ruby
      RSpec.shared_examples "shared" do
        it "fails" do
          expect(1).to eq(2)
        end
      end

      RSpec.describe "Some examples" do
        it "passes" do
          expect(1).to eq(1)
        end

        it "fails" do
          expect(1).to eq(2)
        end

        it_behaves_like "shared"

        context "nested" do
          it "passes" do
            expect(1).to eq(1)
          end

          it "fails" do
            expect(1).to eq(2)
          end
        end
      end
      """
      And a file named "spec/pending_spec.rb" with:
      """ruby
      RSpec.describe "Some pending examples" do
        context "pending" do
          it "is reported as pending" do
            pending; expect(1).to eq(2)
          end

          it "is reported as failing" do
            pending; expect(1).to eq(1)
          end
        end
      end
      """

  Scenario: Use progress formatter with profiling
    When I run `rspec --format progress --profile --order defined`
    Then the output should contain ".FF.F*F"
     And the output should contain "7 examples, 4 failures, 1 pending"
     And the output should not contain any error backtraces

  Scenario: Use doc formatter with profiling
    When I run `rspec --format doc --profile --order defined`
    Then the output should contain "is reported as pending (PENDING: No reason given)"
     And the output should contain "7 examples, 4 failures, 1 pending"
     And the output should not contain any error backtraces

  Scenario: Use json formatter with profiling
    When I run `rspec --format json --profile --order defined`
    Then the output should contain:
     """
     "examples":
     """
     And the output should contain "7 examples, 4 failures, 1 pending"

  Scenario: Use html formatter with profiling
    When I run `rspec --format html --profile --order defined`
    Then the output should contain:
     """
     <span class="comment"># gem install syntax to get syntax highlighting</span>
     """
     And the output should contain "7 examples, 4 failures, 1 pending"
