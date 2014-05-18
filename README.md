# gooddata-ruby-examples

Examples of GoodData Ruby SDK Usage

## Build Status

[![Build Status](https://travis-ci.org/korczis/gooddata-ruby-examples.svg?branch=master)](https://travis-ci.org/korczis/gooddata-ruby-examples)

## Prerequisites

- [ruby](https://www.ruby-lang.org/en/) - Modern programming Language
- [rubygems](https://rubygems.org/)
- [bundler](http://bundler.io/)

## Getting started 

Getting started is few strokes far. Lets see.

```
# Clone repository
git clone https://github.com/korczis/gooddata-ruby-examples.git

# Enter the folder with cloned sources
cd gooddata-ruby-examples

# Install required dependencies using Bundle
bundle install
```
Done. 

You are ready to run all stuff which is in.

## Structure

- [apps](https://github.com/korczis/gooddata-ruby-examples/tree/master/apps) - Example Applications using gooddata ruby gem
  - [goodproject](https://github.com/korczis/gooddata-ruby-examples/tree/master/apps/goodproject) - Command Line Interface for GoodData Platform
- [snippets](https://github.com/korczis/gooddata-ruby-examples/tree/master/snippets) - Simple code pieces demonstrating just one functionality at time
  - [01_core](https://github.com/korczis/gooddata-ruby-examples/tree/master/snippets/01_core) - Core GoodData gem functionality
    - [connect.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/connect.rb) - Connect using username and password
    - [connect_env_vars.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/connect_env_vars.rb) - Connect using username and password from environment variables
    - [handling_errors](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/handling_errors.rb) - Handle possible errors
    - [logging.rb](https://github.com/korczis/gooddata-ruby-examples/blob/master/snippets/01_core/logging.rb) - Verbose logging output.
  - [02_resources](https://github.com/korczis/gooddata-ruby-examples/tree/master/snippets/02_resources) - Examples for each resource - metric, project, report, schedule, user, ...
    - [invitation](https://github.com/korczis/gooddata-ruby-examples/tree/master/snippets/02_resources/invitation) - Invitation related examples.
    - [project](https://github.com/korczis/gooddata-ruby-examples/tree/master/snippets/02_resources/project) - Project related examples.

## Authors

Original authors in alphabetical order.

- [baskoj](https://github.com/baskoj) - Jan Basko
- [korczis](https://github.com/korczis) - Tomas Korcak
- [vpasler](https://github.com/vpasler) - Vojtech Pasler

## License

Project gooddata-ruby-examples is released under the [MIT License](http://www.opensource.org/licenses/MIT).
