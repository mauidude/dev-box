# -*- mode: ruby -*-
# vi: set ft=ruby :

#require 'berkshelf/vagrant'

COOKBOOKS_PATH = File.expand_path('cookbooks', File.dirname(__FILE__))
ROLES_PATH     = File.expand_path('roles', File.dirname(__FILE__))
DATA_BAGS_PATH = File.expand_path('data_bags', File.dirname(__FILE__))
CHEF_JSON_PATH = File.expand_path('chef.json', File.dirname(__FILE__))

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.ssh.forward_agent = true
  config.berkshelf.enabled = true

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  # config.vm.network :hostonly, "192.168.33.10"
  config.vm.network :forwarded_port, guest: 3000, host: 3000

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  # config.vm.forward_port 80, 8080

  # Share an additional folder to the guest VM. The first argument is
  # an identifier, the second is the path on the guest to mount the
  # folder, and the third is the path on the host to the actual folder.
  config.vm.synced_folder "~/workspace/dev-box", "/usr/local/workspace"

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  #

  node = JSON.parse(IO.read(CHEF_JSON_PATH)) if File.exists?(CHEF_JSON_PATH)

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = COOKBOOKS_PATH
    chef.log_level = :debug

    chef.json = {
      :development => {
      }
    }

    # install the following recipies
    chef.run_list = [ "recipe[development]" ]
  end
end
