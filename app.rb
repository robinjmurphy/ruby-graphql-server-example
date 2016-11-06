#! /usr/bin/env ruby

require 'sinatra'
require 'sinatra/sequel'
require 'json'
require 'graphql'
require 'logger'

set :database, 'postgres://localhost/ruby_graphql_server_example'

require_relative './models/fields/episodes'
require_relative './models/show'
require_relative './models/episode'
require_relative './models/season'
require_relative './schema/show'
require_relative './schema/season'
require_relative './schema/episode'
require_relative './schema/query'
require_relative './schema/root'

# This server implements the suggested HTTP protocol
# as described in the GraphQL docs:
#   http://graphql.org/learn/serving-over-http/

configure :development, :staging do
  database.loggers << Logger.new(STDOUT)
end

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
