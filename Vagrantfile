# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'rails-dev-box'

  # Forward SSH agent for Git auth
  config.ssh.forward_agent = true
  # Increase resource allocated for rails
  config.vm.provider 'virtualbox' do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.network :forwarded_port, guest: 3000, host: 1300
  config.vm.network :forwarded_port, guest: 5432, host: 15432
  config.vm.network :forwarded_port, guest: 3306, host: 13306

  config.vm.provision :shell, path: 'scripts/make_swap.sh',  keep_color: true
  config.vm.provision :shell, path: 'scripts/bootstrap.sh',  keep_color: true
  config.vm.network 'private_network', ip: '33.33.33.10'
end
