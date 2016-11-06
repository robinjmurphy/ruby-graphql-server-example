#! /usr/bin/env ruby

require 'bundler'

Bundler.require
$: << File.expand_path('../', __FILE__)

database_url = ENV['DATABASE_URL'] ||
  'postgres://localhost/ruby_graphql_server_example'

set :database, database_url

require 'json'
require 'logger'
require 'app/models'
require 'app/schema'

configure :development, :staging do
  database.loggers << Logger.new(STDOUT)
end

before do
  content_type :json
end

get '/' do
  content_type :html
  erb :graphiql
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

def respond_with_error(status_code, message)
  status status_code
  { error: { message: message, status: status } }.to_json
end

not_found do
  respond_with_error(404, 'Not Found')
end

error do
  respond_with_error(500, env['sinatra.error'].message)
end

error ArgumentError do
  respond_with_error(400, env['sinatra.error'].message)
end
