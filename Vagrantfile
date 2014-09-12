# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  config.vm.define 'ubuntu-12.04' do |ubuntu|
    ubuntu.vm.box      = "chef/ubuntu-12.04"
    ubuntu.vm.hostname = "gocd-cookbook-ubuntu"
    ubuntu.vm.network :private_network, type: "dhcp"
    ubuntu.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "3072"]
    end

    if Vagrant.has_plugin?("vagrant-cachier")
      ubuntu.cache.scope = :box
      ubuntu.cache.enable :apt
      ubuntu.cache.synced_folder_opts = {
        type: :nfs,
        mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
      }
    end

    ubuntu.vm.provision :chef_solo do |chef|
      chef.run_list = [
        "recipe[gocd-cookbook::go-agent]",
        "recipe[gocd-cookbook::go-server]",
      ]
    end

  end

  config.vm.define 'centos-6.5' do |centos|
    centos.vm.box      = "chef/centos-6.5"
    centos.vm.hostname = "gocd-cookbook-centos"
    centos.vm.network :private_network, type: "dhcp"
    centos.vm.provider :virtualbox do |vb|
      vb.gui = false
      vb.customize ["modifyvm", :id, "--memory", "3072"]
    end

    if Vagrant.has_plugin?("vagrant-cachier")
      centos.cache.scope = :box
      centos.cache.enable :yum
      centos.cache.synced_folder_opts = {
        type: :nfs,
        mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
      }
    end

    centos.vm.provision :chef_solo do |chef|
      chef.run_list = [
        "recipe[gocd-cookbook::go-agent]",
        "recipe[gocd-cookbook::go-server]",
      ]
    end
  end

end
