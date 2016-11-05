require 'sequel'
require 'logger'

DB = Sequel.connect('postgres://localhost/ruby_graphql_server_example')
DB.loggers << Logger.new($stdout)
