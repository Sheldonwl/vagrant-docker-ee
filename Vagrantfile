# -*- mode: ruby -*-
# vi: set ft=ruby :

# https://storebits.docker.com/ee/trial/sub-9dbd565a-6f1e-457a-95b4-3ff3136943df

Vagrant.configure("2") do |config|
  # config.vm.network "public_network"
  
  #WORKING Master
  config.vm.define "ucpMaster" do |workerdtr| 
    workerdtr.vm.box = "centos/7"
    workerdtr.vm.hostname = "ucp-master"
    workerdtr.vm.box_check_update = false
    config.vm.network "private_network", ip: "192.168.33.11"
    #workerdtr.vm.network "forwarded_port", guest: 80, host: 8880, host_ip: "127.0.0.1"
    workerdtr.vm.provision "shell", path: "scripts/ucp-master-install.sh"
    workerdtr.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        vb.name = "ucpMaster"
        vb.memory = "6144"
        vb.cpus = 1
      end
  end

  #WORKING Worker1
  config.vm.define "ucpWorker1" do |workerdtr| 
    workerdtr.vm.box = "centos/7"
    workerdtr.vm.hostname = "ucp-worker1"
    workerdtr.vm.box_check_update = false
    config.vm.network "private_network", ip: "192.168.33.12"
    #workerdtr.vm.network "forwarded_port", guest: 80, host: 8880, host_ip: "127.0.0.1"
    workerdtr.vm.provision "shell", path: "scripts/docker-ee-install.sh"
    workerdtr.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        vb.name = "ucpWorker1"
        vb.memory = "2048"
        vb.cpus = 1
      end
  end

  config.vm.define "workerWithDTR" do |workerWithDTR| 
    workerWithDTR.vm.box = "centos/7"
    workerWithDTR.vm.hostname = "worker-with-dtr"
    workerWithDTR.vm.box_check_update = false
    workerWithDTR.vm.network "private_network", ip: "192.168.33.13"
    workerWithDTR.vm.provision "shell", path: "scripts/worker-with-dtr-install.sh"
    workerWithDTR.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        vb.name = "workerWithDTR"
        vb.memory = "2048"
        vb.cpus = 1
      end
  end
end
