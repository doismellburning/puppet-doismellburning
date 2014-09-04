# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = ENV['VAGRANT_BOX'] || 'wheezy64'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  if ENV['VAGRANT_HOSTNAME']
    puts "Configuring VM with hostname #{ENV['VAGRANT_HOSTNAME']}"
	config.vm.hostname = ENV['VAGRANT_HOSTNAME']
  end

  config.vm.synced_folder "./hiera-data", "/opt/doismellburning/puppet/hiera"

  if ENV['VAGRANT_SOURCE_PATH']
    config.vm.synced_folder ENV['VAGRANT_SOURCE_PATH'], "/opt/doismellburning/source"
  end

  config.vm.provision :shell do |shell|
	FACT_DIR = "/etc/facter/facts.d"
	FACT_FILE = "#{FACT_DIR}/doismellburning.txt"
	shell.inline = "
mkdir -p #{FACT_DIR}
echo 'role=#{ENV['VAGRANT_ROLE']}\nenvironment=#{ENV['VAGRANT_ENVIRONMENT']}\nlocation=#{ENV['VAGRANT_LOCATION']}' > #{FACT_FILE}
"
  end

  config.vm.provision :puppet do |puppet|
	puppet.module_path = ["modules", "internal"]
	puppet.manifest_file = "site.pp"
	puppet.options = "--write-catalog-summary --hiera_config /vagrant/hiera.yaml"
  end

end
