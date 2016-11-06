db = 'ruby_graphql_server_example'

task :default => [:start]

namespace :db do
  desc "Create the database"
  task :create do
    sh "createdb #{db} || true"
  end

  desc "Create the database schema"
  task :migrate => :create do
    sh "psql -d #{db} -f db/schema.sql"
  end

  desc "Add the seed data"
  task :seed do
    sh "psql -d #{db} -f db/seeds.sql"
  end

  desc "Open the psql console"
  task :psql do
    sh "psql -d #{db}"
  end
end
