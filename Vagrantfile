Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"

  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.network :forwarded_port, host: 8000, guest: 80, auto_correct: true
  config.vm.network :forwarded_port, host: 5000, guest: 5000, auto_correct: true
  config.vm.network :forwarded_port, host: 35357, guest: 35357, auto_correct: true

  config.vm.network "private_network", ip: "192.168.56.11"

  #config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.memory = "8192"
  end
end
