#! /usr/bin/env ruby

require 'sinatra'
require 'json'

require_relative './lib/schema'

def current_time
  Time.now.iso8601
end

before do
  content_type :json
end

post '/graphql' do
  params = JSON.parse(request.body.read)
  query = params['query']
  variables = params['variables']
  result = Schema.execute(query, variables: variables)
  result.to_json
end
