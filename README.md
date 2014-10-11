HTTParty Test Suite
========

This is a suite that’s tests the CRUD (Create, Read, Update, Delete) abilities of the http://lacedeamon.spartaglobal.com/todos website using HTTParty and RSpec.

To use:

To initialize the test suite, two gems are required to be installed. HTTParty and RSpec. Both gems can be installed with the command lines:

gem install httparty
gem install rspec

Running the rspec simply requires the user to type in rspec  in the command line while in the httparty directory. 
The spec_helper file contains methods which are used for the test files. All the other files are the tests themselves. The reason the tests are split into various files is to make it clear what the tests are categorised as, e.g. testing with objects, without objects, etc.
