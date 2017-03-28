# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "private_network", ip: "192.168.50.5"

  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 8081, host: 8081
  config.vm.network "forwarded_port", guest: 8888, host: 8888
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 15672, host: 15672 # rabbitmq_management

  # On Windows Host and running in an administrator cmd shell?
  if Vagrant::Util::Platform.windows? && system("net session", :out => File::NULL, :err => File::NULL) then
    config.vm.synced_folder ".", "/vagrant", type: "smb", smb_username: "#{ENV['USERNAME']}@#{ENV['USERDOMAIN']}"
  end

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    #vb.gui = true

    # Customize the amount of memory on the VM:
    vb.memory = "2536"
    vb.cpus = 1
  end
  config.vm.provision "shell", run: "always", inline: <<-SHELL
    /sbin/route add -net 10.244.0.0/16 gw 192.168.50.4
  SHELL

  config.vm.provision "shell", path: "vm-config/provision.sh"
end
