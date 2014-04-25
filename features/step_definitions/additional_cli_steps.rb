Then /^the output should not contain any error backtraces$/ do
  step %q{the output should not contain "lib/rspec/core"}
  step %q{the output should not contain "lib/rspec/legacy_formatters"}
end
