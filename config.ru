require 'heroku-forward'
require 'heroku/forward/backends/unicorn'

application = File.expand_path('../jobsworth.ru', __FILE__)
config_file = File.expand_path('../config/unicorn.rb', __FILE__)
backend = Heroku::Forward::Backends::Unicorn.new(application: application, env: env, config_file: config_file)
proxy = Heroku::Forward::Proxy::Server.new(backend, host: '0.0.0.0', port: port)
proxy.forward!
