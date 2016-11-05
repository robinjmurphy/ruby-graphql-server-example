db = 'ruby_graphql_server_example'

task :default => [:start]

task :start do
  ruby 'app.rb'
end

task :dev do
  sh 'bundle exec shotgun'
end

task :setup_db do
  sh "createdb #{db} || true"
  sh "psql -d #{db} -f sql/schema.sql"
end

task :seed_db => :setup_db do
  sh "psql -d #{db} -f sql/seed.sql"
end

task :psql do
  sh "psql -d #{db}"
end
