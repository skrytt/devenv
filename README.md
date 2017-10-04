# devenv
Personal development environment files

* **vagrant/Vagrantfile:** Config/provisioning for a VirtualBox VM with debian/contrib-stretch64 as the base image.
* **vagrant/salt/...:** Salt config and state files for masterless configuration management.
* **config/...:** Configuration files required by the salt state files.

scripts/provision.sh is an old script I used for provisioning my development machines. This was mostly satisfactory but fairly error-prone, since I would need to instrument logic specific to individual machines. Using a configuration management tool seems to be more sensible here.
