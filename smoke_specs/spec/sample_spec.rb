RSpec.configure { |c| c.failure_exit_code = 42 }

RSpec.describe 'Prove that legacy formatters runs on this version' do
  specify "success for #{ENV['RSPEC_VERSION']}" do
    expect(true).to be true
  end

  specify "failure for #{ENV['RSPEC_VERSION']}" do
    expect(true).to be false
  end
end
