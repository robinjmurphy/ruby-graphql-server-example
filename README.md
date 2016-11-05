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
rake setup_db
```

Add some seed data:

```
rake seed_db
```

Start the server:

```
rake start
```

## Development

To use [Shotgun](https://github.com/rtomayko/shotgun) to reload the server in development:

```
rake dev
```
