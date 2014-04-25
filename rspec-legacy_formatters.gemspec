# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/legacy_formatters/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-legacy_formatters"
  spec.version       = RSpec::LegacyFormatters::Version::STRING
  spec.authors       = ["Jon Rowe"]
  spec.email         = ["hello@jonrowe.co.uk"]
  spec.email         = "rspec@googlegroups.com"
  spec.homepage      = "http://github.com/rspec/rspec-legacy_formatters"
  spec.summary       = "rspec-legacy_formatters-#{RSpec::LegacyFormatters::Version::STRING}"
  spec.description   = %q{Support for RSpec 2.x formatters on 3.x}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = []
  spec.rdoc_options  = ["--charset=UTF-8"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.8.7'

  private_key = File.expand_path('~/.gem/rspec-gem-private_key.pem')
  if File.exist?(private_key)
    spec.signing_key = private_key
    spec.cert_chain = [File.expand_path('~/.gem/rspec-gem-public_cert.pem')]
  end

  spec.add_runtime_dependency     "rspec-core",    ">= 3.0.0.beta2"
  spec.add_runtime_dependency     "rspec-support", ">= 3.0.0.beta2"

  spec.add_development_dependency "cucumber", "~> 1.3"
  spec.add_development_dependency "aruba",    "~> 0.5"
  spec.add_development_dependency "rake",     "~> 10.0.0"

  # For legacy custom formatter regression tests
  spec.add_development_dependency "fuubar",                 "1.3.2"
  spec.add_development_dependency "nyan-cat-formatter",     "0.5.2"
  spec.add_development_dependency "rspec-instafail",        "0.2.4"
  spec.add_development_dependency "rspec-extra-formatters", "1.0.0"
  spec.add_development_dependency "fivemat",                "1.2.1"
end
