root = "/home/ding/apps/experimental-center/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.experimental-center.sock"
worker_processes 2
timeout 30

# Force the bundler gemfile environment variable to
# # reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end

#root = "/var/www/zlog/current"
#working_directory root
#pid "#{root}/tmp/pids/unicorn.pid"
#stderr_path "#{root}/log/unicorn.log"
#stdout_path "#{root}/log/unicorn.log"

#listen "tmp/unicorn.zlog.sock"
#worker_processes 2
#timeout 30

## Force the bundler gemfile environment variable to
## reference the capistrano "current" symlink
#before_exec do |_|
  #ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
#end
