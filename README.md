# ruby-graphql-server-example

> An example GraphQL server implementation in Ruby

* [Requirements](#requirements)
* [Installation](#installation)
* [Usage](#usage)
* [Data model](#data-model)
* [Example queries](#example-queries)
* [Development](#development)

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

## Data model

The data model represents a simple video-on-demand service that displays shows, seasons and episodes.

```graphql
type Show {
  id: ID!
  title: String!
  seasons: [Season]!
  episodes: [Episode]!
}

type Season {
  id: ID!
  title: String!
  number: Int!
  episodes: [Episode]!
}

type Episode {
  id: ID!
  title: String!
  number: Int!
  show: Show!
  season: Season!
}
```

## Example queries

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

> Here I'm using `jq` (`brew instal jq`) to get a pretty-printed JSON output

The output of running the `curl` command will look something like:

```json
{
  "data": {
    "shows": [
      {
        "id": "b013pqnm",
        "title": "The Great British Bake-Off"
      },
      {
        "id": "b0071b63",
        "title": "The Apprentice"
      },
      {
        "id": "b062r9t5",
        "title": "People Just Do Nothing"
      }
    ]
  }
}
```

We can then modify the query to return the nested episodes in each show:

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
