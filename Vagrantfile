# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/bionic64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.

  config.vm.box_check_update = false

  # Time to wait for boot
  config.vm.boot_timeout = 600

  config.vm.define "db", primary: true do |db|
    db.vm.box = "ubuntu/bionic64"
    db.vm.hostname = "db.local"
    db.vm.network "private_network", ip: "192.168.60.100", nic_type: "virtio"
    db.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: [ "en0: Wi-Fi (AirPort)", "en1: Thunderbolt 1", "en2: Thunderbolt 2" ]
    db.vm.provider "virtualbox" do |vb|
        vb.name = "DB"
        vb.gui = false
        vb.memory = "2048"
        vb.cpus = 2
        vb.customize ["modifyvm", :id, "--vram", "128"]
        vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"]
    end
    db.vm.provision "puppet" do |puppet|
        puppet.manifests_path = 'puppet/manifests'
        puppet.module_path = 'puppet/modules'
        puppet.manifest_file = 'db.pp'
    end
  end

  config.vm.define "worker1" do |worker1|
      worker1.vm.box = "ubuntu/bionic64"
      worker1.vm.hostname = "worker1.local"
      worker1.vm.network "private_network", ip: "192.168.60.101", nic_type: "virtio"
      worker1.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: [ "en0: Wi-Fi (AirPort)", "en1: Thunderbolt 1", "en2: Thunderbolt 2" ]
      worker1.vm.provider "virtualbox" do |vb|
          vb.name = "Worker1"
          vb.gui = false
          vb.memory = "1024"
          vb.cpus = 1
          vb.customize ["modifyvm", :id, "--vram", "128"]
          vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"]
      end
      worker1.vm.synced_folder "./workers", "/var/www/test.local", owner: "www-data", group: "vagrant", create: true, mount_options: ['dmode=777','fmode=666']
      worker1.vm.provision "puppet" do |puppet|
              puppet.manifests_path = 'puppet/manifests'
              puppet.module_path = 'puppet/modules'
              puppet.manifest_file = 'worker.pp'
      end
  end

 config.vm.define "worker2" do |worker2|
     worker2.vm.box = "ubuntu/bionic64"
     worker2.vm.hostname = "worker2.local"
     worker2.vm.network "private_network", ip: "192.168.60.102", nic_type: "virtio"
     worker2.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: [ "en0: Wi-Fi (AirPort)", "en1: Thunderbolt 1", "en2: Thunderbolt 2" ]
     worker2.vm.provider "virtualbox" do |vb|
         vb.name = "Worker2"
         vb.gui = false
         vb.memory = "1024"
         vb.cpus = 1
         vb.customize ["modifyvm", :id, "--vram", "128"]
         vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"]
     end
     worker2.vm.synced_folder "./workers", "/var/www/test.local", owner: "www-data", group: "vagrant", create: true, mount_options: ['dmode=777','fmode=666']
     worker2.vm.provision "puppet" do |puppet|
         puppet.manifests_path = 'puppet/manifests'
         puppet.module_path = 'puppet/modules'
         puppet.manifest_file = 'worker.pp'
    end
 end

  config.vm.define "worker3" do |worker3|
      worker3.vm.box = "ubuntu/bionic64"
      worker3.vm.hostname = "worker3.local"
      worker3.vm.network "private_network", ip: "192.168.60.103", nic_type: "virtio"
      worker3.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: [ "en0: Wi-Fi (AirPort)", "en1: Thunderbolt 1", "en2: Thunderbolt 2" ]
      worker3.vm.provider "virtualbox" do |vb|
          vb.name = "Worker3"
          vb.gui = false
          vb.memory = "1024"
          vb.cpus = 1
          vb.customize ["modifyvm", :id, "--vram", "128"]
          vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"]
      end
      worker3.vm.synced_folder "./workers", "/var/www/test.local", owner: "www-data", group: "vagrant", create: true, mount_options: ['dmode=777','fmode=666']
      worker3.vm.provision "puppet" do |puppet|
          puppet.manifests_path = 'puppet/manifests'
          puppet.module_path = 'puppet/modules'
          puppet.manifest_file = 'worker.pp'
      end
  end

  config.vm.define "worker4" do |worker4|
        worker4.vm.box = "ubuntu/bionic64"
        worker4.vm.hostname = "worker4.local"
        worker4.vm.network "private_network", ip: "192.168.60.104", nic_type: "virtio"
        worker4.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: [ "en0: Wi-Fi (AirPort)", "en1: Thunderbolt 1", "en2: Thunderbolt 2" ]
        worker4.vm.provider "virtualbox" do |vb|
            vb.name = "Worker4"
            vb.gui = false
            vb.memory = "1024"
            vb.cpus = 1
            vb.customize ["modifyvm", :id, "--vram", "128"]
            vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"]
      end
      worker4.vm.synced_folder "./workers", "/var/www/test.local", owner: "www-data", group: "vagrant", create: true, mount_options: ['dmode=777','fmode=666']
      worker4.vm.provision "puppet" do |puppet|
          puppet.manifests_path = 'puppet/manifests'
          puppet.module_path = 'puppet/modules'
          puppet.manifest_file = 'worker.pp'
      end
  end

  config.vm.define "worker5" do |worker5|
        worker5.vm.box = "ubuntu/bionic64"
        worker5.vm.hostname = "worker5.local"
        worker5.vm.network "private_network", ip: "192.168.60.105", nic_type: "virtio"
        worker5.vm.network "public_network", use_dhcp_assigned_default_route: true, bridge: [ "en0: Wi-Fi (AirPort)", "en1: Thunderbolt 1", "en2: Thunderbolt 2" ]
        worker5.vm.provider "virtualbox" do |vb|
            vb.name = "Worker5"
            vb.gui = false
            vb.memory = "1024"
            vb.cpus = 1
            vb.customize ["modifyvm", :id, "--vram", "128"]
            vb.customize ["storageattach", :id, "--storagectl", "IDE", "--port", "0", "--device", "0", "--type", "dvddrive", "--medium", "/Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso"]
      end
      worker5.vm.synced_folder "./workers", "/var/www/test.local", owner: "www-data", group: "vagrant", create: true, mount_options: ['dmode=777','fmode=666']
      worker5.vm.provision "puppet" do |puppet|
          puppet.manifests_path = 'puppet/manifests'
          puppet.module_path = 'puppet/modules'
          puppet.manifest_file = 'worker.pp'
      end
  end

  # SSH options.
  config.ssh.insert_key = true
  config.ssh.forward_agent = true

  # INSTALL PUPPET
  #
  config.vm.provision "shell", inline: <<-SHELL
  FILE=/tmp/aptupdate
  if [ ! -f $FILE ]; then
    sudo apt-get update
    touch $FILE
  fi
  if ! dpkg --get-selections | grep "^puppet\s.*install$"; then
    sudo apt-get install -y puppet
  fi
  SHELL

  # GuestAdditions
  #
  config.vbguest.auto_update = true
  config.vbguest.no_remote = false

end
