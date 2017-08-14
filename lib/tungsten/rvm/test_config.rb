require 'tungsten/rvm'

server '127.0.0.1:2222', roles: [:app], user: 'vagrant', key: '.vagrant/machines/default/virtualbox/private_key'

role :app do
  uses :rvm
end
