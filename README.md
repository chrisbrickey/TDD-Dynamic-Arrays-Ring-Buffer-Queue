# test-driven-data-structures
This is a study in the underlying behavior of high-level arrays (e.g. Python lists).  Using test-driven development, I've created classes that mimic the arrays of higher-level languages with an API (e.g. push, pop methods) that operates on static arrays.

## To run tests from command line
*All tests cannot be run together due to multiple spec and lib directories*
- All tests within a category: e.g. `bundle exec rspec spec_array/`
- Specific classes: e.g. `bundle exec rspec spec_array/filename.ext`

## Dependencies (RSpec 3.6)
- ruby 2.4.0
- rspec-core 3.6.0
- rspec-expectations 3.6.0
- rspec-mocks 3.6.0
- rspec-support 3.6.0Â
