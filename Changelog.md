### 1.0.2 / 2019-09-18

Bug Fixes:

* Fix formatters using / extending the legacy HTML formatter which would crash
  due to a change in the `SnippetExtractor` in RSpec 3.4. (Jon Rowe, #22)

### 1.0.1 / 2015-11-05
[Full Changelog](http://github.com/rspec/rspec-legacy_formatters/compare/v1.0.0...v1.0.1)

Bug Fixes:

* Require 'rspec-core' directly to ensure load ordering doesn't
  affect us. (Jon Rowe, #9)
* Fix incompatibility with RSpec 3.3 related to `NullConverter`.
  (Jon Rowe, #17)

### 1.0.0 / 2014-06-01

Minor changes to internals and specs. Releasing to take it out of pre-release.

### 1.0.0.rc1 / 2014-05-16

Initial release.
