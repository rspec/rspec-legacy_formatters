source "https://rubygems.org"

gemspec

### deps for rdoc.info
platforms :ruby do
  gem 'redcarpet',     '2.1.1'
  gem 'github-markup', '0.7.2'
end

if RUBY_VERSION < '2.2.0' && !!(RbConfig::CONFIG['host_os'] =~ /cygwin|mswin|mingw|bccwin|wince|emx/)
  gem 'ffi', '< 1.10'
elsif RUBY_VERSION < '2.0'
  gem 'ffi', '< 1.9.19' # ffi dropped Ruby 1.8 support in 1.9.19
elsif defined?(RUBY_ENGINE) && RUBY_ENGINE == 'rbx'
  gem 'ffi', '< 1.11.0'
else
  gem 'ffi', '~> 1.11.0'
end

gem 'simplecov', '~> 0.8'

gem 'contracts', '< 0.16' if RUBY_VERSION < '1.9.0'

platforms :ruby_18, :ruby_19, :jruby do
  if RUBY_VERSION < '2.0.0' || RUBY_ENGINE == 'java'
    gem 'json', '< 2.0.0'
  else
    gem 'json', '> 2.3.0'
  end
end

platforms :jruby do
  gem "jruby-openssl"
end

eval File.read('Gemfile-custom') if File.exist?('Gemfile-custom')
