#! /usr/bin/env ruby

require 'sinatra'
require 'json'

require_relative './lib/schema'

# This server implements the suggested HTTP protocol
# as described in the GraphQL docs:
#   http://graphql.org/learn/serving-over-http/

before do
  content_type :json
end

get '/graphql' do
  query = params['query']
  variables = params['variables']
  result = Schema.execute(query, variables: variables)
  result.to_json
end

post '/graphql' do
  pass unless request.content_type =~ /application\/graphql/
  query = request.body.read
  result = Schema.execute(query)
  result.to_json
end

post '/graphql' do
  params = JSON.parse(request.body.read)
  query = params['query']
  variables = params['variables']
  result = Schema.execute(query, variables: variables)
  result.to_json
end

