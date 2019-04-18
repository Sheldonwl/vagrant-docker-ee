# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  (1..1).each do |i|
    config.vm.define "ucp-#{i}" do |ucp| 
      ucp.vm.box = "centos/7"
      ucp.vm.hostname = "ucp-#{i}"
      ucp.vm.box_check_update = false
      ucp.vm.network "private_network", ip: "192.168.33.1#{i}"
      ucp.vm.provision "shell", path: "scripts/docker-ee-install.sh"
      ucp.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.name = "ucp-#{i}"
          vb.memory = "4096"
          vb.cpus = 1
        end
    end
  end

  (1..2).each do |i|
    config.vm.define "node-#{i}" do |node| 
      node.vm.box = "centos/7"
      node.vm.hostname = "node-#{i}"
      node.vm.box_check_update = false
      node.vm.network "private_network", ip: "192.168.33.10#{i}"
      node.vm.provision "shell", path: "scripts/docker-ee-install.sh"
      node.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.name = "node-#{i}"
          vb.memory = "2048"
          vb.cpus = 1
        end
    end
  end

  (1..1).each do |i|
    config.vm.define "dtr-#{i}" do |dtr| 
      dtr.vm.box = "centos/7"
      dtr.vm.hostname = "dtr-#{i}"
      dtr.vm.box_check_update = false
      dtr.vm.network "private_network", ip: "192.168.33.11#{i}"
      dtr.vm.provision "shell", path: "scripts/docker-ee-install.sh"
      dtr.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.name = "dtr-#{i}"
          vb.memory = "2048"
          vb.cpus = 1
        end
    end
  end
end
