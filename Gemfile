source "https://rubygems.org"

gemspec

### deps for rdoc.info
platforms :ruby do
  gem 'redcarpet',     '2.1.1'
  gem 'github-markup', '0.7.2'
end

gem 'simplecov', '~> 0.8'

platforms :ruby_18, :jruby do
  gem 'json'
end

platforms :jruby do
  gem "jruby-openssl"
end

eval File.read('Gemfile-custom') if File.exist?('Gemfile-custom')
