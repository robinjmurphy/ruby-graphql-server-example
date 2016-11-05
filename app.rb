#! /usr/bin/env ruby

require 'sinatra'
require 'json'

def current_time
  Time.now.iso8601
end

before do
  content_type :json
end

get '/' do
  {
    timestamp: current_time
  }.to_json
end
