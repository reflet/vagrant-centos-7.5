# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "reflet/centos-7.5"
  config.vm.box_version = "1.0.0"
  config.vm.hostname = "centos75"
  config.vm.network "private_network", ip: "192.168.33.10"
  #config.vm.synced_folder "./opt/", "/home/docker/opt/", create:true, :nfs => true
  config.vm.synced_folder "./opt/", "/home/docker/opt/", create:true
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vm.provision :shell, :path => "provision.sh"

  # auto update off.
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  # メモリ設定
  config.vm.provider "virtualbox" do |vm|
    vm.memory = 1024
  end
end
