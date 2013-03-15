vagrant-demo
============

This is an example LAMP server configured with Vagrant. The machine is configured using Puppet, which means that the configuration is documented, and repeatable in both development and production environments. Pre-built modules are available on the [Puppet Forge](http://forge.puppetlabs.com/) which can be placed in ``VagrantConf/modules`` if you need more Puppet functionality

The username and password are both ``vagrant``.

## Usage

``vagrant up`` - Boot the VM. If the box doesn't exist, create it. Configuration will be applied.

``vagrant halt`` - Shutdown the VM, but keep it on disk.

``vagrant destroy`` - Delete the VM.

``vagrant reload`` - Reboot the VM

``vagrant ssh`` - SSH into the VM.