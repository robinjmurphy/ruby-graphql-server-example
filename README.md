# ruby-graphql-server-example

> An example GraphQL server implementation in Ruby

## Requirements

* [Ruby](https://www.ruby-lang.org/en/)
* [Bundler](http://bundler.io/)
* [PostgreSQL](https://www.postgresql.org/)

## Installation

```
bundle install
```

## Usage

Create your local database:

```
bundle exec rake db:setup
```

Add some seed data:

```
bundle exec rake db:seed
```

Start the server:

```
bundle exec ruby app.rb
```

## Development

To use [Shotgun](https://github.com/rtomayko/shotgun) to reload the server in development:

```
bundle exec shotgun
```
