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

### Example requests

Let's create a simple GraphQL query in a `query.gql` file:

```graphql
{
  shows {
    id
    title
  }
}
```

You can run that query against the server using `curl`:

```graphql
curl -X POST http://localhost:4567/graphql \
  -H 'Content-Type: application/graphql' \
  -d @query.gql | jq .
```

> I'm using `jq` (`brew instal jq`) to get a pretty-printed JSON output

We can modify the query to return the nested episodes in each show:

```graphql
{
  shows {
    id
    title
    episodes {
      id
      number
      title
    }
  }
}
```

We can use arguments on the `episodes` field to return only the latest episode of each show:

```graphql
{
  shows {
    id
    title
    episodes(limit: 1, sortDirection: "desc") {
      id
      number
      title
    }
  }
}
```

We can query for a particular show:

```graphql
{
  show(id: "b013pqnm") {
    id
    title
  }
}
```

And then retrieve its entire hierarchy, including seasons and episodes:

```graphql
{
  show(id: "b013pqnm") {
    id
    title,
    seasons {
      id
      title
      number
      episodes {
        id
        title
        number
      }
    }
  }
}
```

We can also a retrieve an episode by its ID:

```graphql
{
  episode(id: "b07v324h") {
    id
    number
    title
  }
}
```

And return its season and show:

```graphql
{
  episode(id: "b07v324h") {
    id
    number
    title
    season {
      id
      title
    }
    show {
      id
      title
    }
  }
}
```

## Development

To use [Shotgun](https://github.com/rtomayko/shotgun) to reload the server in development:

```
bundle exec shotgun
```
