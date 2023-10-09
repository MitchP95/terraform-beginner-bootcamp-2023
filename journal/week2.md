# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager specific for ruby  that allows the user to install ruby packages.

### Install Gems

A gemfile defines gems (or modules) to install.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Gems indicated in the gemfile are installed with the `bundle install` command.

The Gem.lock file is created to fix gem versions used in the project.

#### Executing ruby scripts in the context of bundler

The `bundle exec` command informs ruby scripts to use installed gems. This allows the set of a context.

### Sinatra

A micro web framework for ruby, used for building web apps.

Sinatra excels at creating mock or development servers, it facilitates very simple projects.

Allow shte user to create a web server in a single file.

[Sinatra](https://sinatrarb.com/)

## Terratowns Mock Servers

### Running the web server

Run the web server with the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All code the the server is contained in [`server.rb`](/terratowns_mock_server/server.rb).