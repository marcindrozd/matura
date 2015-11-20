set :stage, :production

server ENV["OVH_PRODUCTION_SERVER"], user: 'deploy', roles: %w{web app}
