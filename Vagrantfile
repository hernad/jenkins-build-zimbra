# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu-16.04-dev-zimbra"

  config.persistent_storage.enabled = true
  config.persistent_storage.location = "data_zimbra-build-2.vdi"
  config.vm.box_check_update = false

  # NO! this is already in ubuntu-16.04-dev Vagrant.template, so it would be ran 2x"
  #config.vm.provision "shell", inline: <<-SHELL
  #   chmod +x /vagrant/vagrant.sh
  #   /vagrant/vagrant.sh
  #SHELL

end
