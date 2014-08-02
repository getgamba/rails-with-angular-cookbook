# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "rails-cookbook"
  config.vm.box = "hirotaka/ubuntu-utopic-ja"
  config.vm.network :private_network, ip: "192.168.33.11"
  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    vb.gui = false
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]

    # VBox name
    vb.name = 'rails-cookbook'
  end
  config.omnibus.chef_version = :latest
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["berks-cookbooks"]
    chef.json = {
      :mysql => {
        :server_root_password => '',
        :server_debian_password => '',
        :server_repl_password => ''
      }
    }

    chef.run_list = [
      "recipe[rails::default]"
    ]
  end
end
