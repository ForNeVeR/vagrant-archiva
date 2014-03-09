# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

$puppetScript = <<SCRIPT
puppet module install --force saz/timezone
puppet module install --force maestrodev/wget
puppet module install --force maestrodev/archiva
SCRIPT

# This should fix the archiva issue https://jira.codehaus.org/browse/MRM-1807
# (not actual for 2.0.1 release)
$archivaScript = <<SCRIPT
wget -O /tmp/default-archiva.xml "http://svn.apache.org/viewvc/archiva/trunk/archiva-modules/archiva-base/archiva-configuration/src/main/resources/org/apache/archiva/configuration/default-archiva.xml?revision=1571882&view=co&pathrev=1571882"
cp -f /tmp/default-archiva.xml /usr/local/apache-archiva-2.0.0/conf/archiva.xml
service archiva restart
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppet-centos-65-x64"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
  config.vm.hostname = "archiva"
  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", "1024" ]
  end

  config.vm.provision :shell, :inline => $puppetScript
  config.vm.provision :puppet,
  :options => ["--verbose", "--summarize"],
  :facter => { "fqdn" => "archiva.sandbox.internal" } do |puppet|
    puppet.manifests_path = "./"
    puppet.manifest_file = "archiva.pp"
  end
  config.vm.provision :shell, :inline => $archivaScript
end
