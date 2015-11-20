set :application, 'matura'
set :repo_url, 'git@bitbucket.org:marcindrozd/matura.git'

set :deploy_to, '/home/deploy/matura'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end