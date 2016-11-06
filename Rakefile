db = 'ruby_graphql_server_example'

task :default => [:start]

namespace :db do
  desc "Setup the database"
  task :setup do
    sh "createdb #{db} || true"
    sh "psql -d #{db} -f sql/schema.sql"
  end

  desc "Add seed data to the database"
  task :seed => :setup do
    sh "psql -d #{db} -f sql/seed.sql"
  end

  desc "Open the psql console"
  task :psql do
    sh "psql -d #{db}"
  end
end
