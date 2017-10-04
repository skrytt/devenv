# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-stretch64"
  #config.vm.hostname "debian-stretch64"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
    vb.memory = "1024"
  end

  config.vm.synced_folder "salt/roots/",
    "/srv/salt/"

  config.vm.synced_folder "../../vboxshare/",
    "/vboxshare/"

  # Ports 8080 and 8443 on the host reach ports 80 and 443 on the guest
  # respectively, though they may be remapped if the host ports are in use
  config.vm.network "forwarded_port",
    guest: 80,
    host: 8080,
    auto_correct: true
  config.vm.network "forwarded_port",
    guest: 443,
    host: 8443,
    auto_correct: true

  config.vm.network "private_network",
    ip: "10.0.0.2"

  config.vm.provision :salt do |salt|
    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
  end

end
