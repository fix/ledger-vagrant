Vagrant.configure("2") do |config|

	# Specify the base box
	config.vm.box = "ubuntu/trusty64"

  # VM specific configs
  config.vm.provider "virtualbox" do |v|
  	v.name = "Ledger development box"
  	v.customize ["modifyvm", :id, "--memory", "1024"]

    # Connect Ledger Nano S throug usb
    v.customize ["modifyvm", :id, "--usb", "on"]
    v.customize ["modifyvm", :id, "--usbehci", "on"]
    v.customize ["usbfilter", "add", "0",
      "--target", :id,
      "--name", "Ledger Nano S",
      "--manufacturer", "Ledger",
      "--product", "Nano S"]
  end

  # Shell provisioning
  config.vm.provision "shell" do |s|
  	s.path = "provision/setup.sh"
  end
end
