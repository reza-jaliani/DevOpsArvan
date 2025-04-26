# Step1Learning.md

## Introduction

In this document, I will detail my learning steps for Vagrant and Packer as I explore virtual machine provisioning and automation, using VirtualBox as the provider on Ubuntu 24.

### 1. Setting Up the Environment


Before getting started with Vagrant and VirtualBox, it’s important to ensure that the environment is set up correctly:

1. Ubuntu 24: The host operating system was chosen to set up the development environment.
2. VirtualBox: This is the virtualization software where we will run our VMs. Vagrant uses VirtualBox to create, manage, and control the virtual machines.
3. Vagrant: A tool for managing virtual machine environments, allowing for easy creation, configuration, and provisioning of machines.
4. This setup allows you to work in isolated environments for testing, development, and learning, while using the same machine.

### 2. Installing Vagrant


We began by installing Vagrant on the host machine (Ubuntu 24) to help manage virtual environments.

        sudo apt update
        sudo apt install vagrant
        vagrant --version

### 3. Creating and Configuring Virtual Machines


Once Vagrant is installed, the next step is to create and configure virtual machines using a Vagrantfile. The Vagrantfile is a configuration file that defines the settings for one or more VMs.

***1. Defining the VM in the Vagrantfile:***

        Vagrant.configure("2") do |config|
          config.vm.define "test1" do |vm1|
            vm1.vm.box = "ubuntu/bionic64"  # Base operating system
            vm1.vm.hostname = "VirtualMachineOne"  # VM hostname
            vm1.vm.network "private_network", ip: "192.168.56.10"  # Private IP for VM
            vm1.vm.network "forwarded_port", guest: 80, host: 8080  # Port forwarding
          end
        end

* `config.vm.define "test1"`: Defines the VM named "test1".

* `vm1.vm.box = "ubuntu/bionic64"`: Specifies the base image (or "box") to use for the VM. In this case, we are using Ubuntu 18.04 (bionic64).

* `vm1.vm.hostname = "VirtualMachineOne"`: Sets the hostname of the VM. This is the name by which the VM will be recognized.

* `vm1.vm.network "private_network", ip: "192.168.56.10"`: Configures the VM to use a private network with a specific IP address. This allows the VM to communicate with other VMs on the same network.

* `vm1.vm.network "forwarded_port", guest: 80, host: 8080`: Port forwarding allows the guest (VM) to access certain services on the host. Here, guest port 80 (typically used for web servers) is forwarded to port 8080 on the host.

After configuring the VM in the Vagrantfile, we run the following command:

        vagrant up

`vagrant up`: Starts the VM based on the settings in the `Vagrantfile`.

### 4. Synced Folders with Vagrant

Synced folders allow us to share files between the host and the guest VM. This is useful for development environments where you need to edit files on the host and test them inside the VM.

To configure a synced folder, we update the Vagrantfile to include the following:

        vm1.vm.synced_folder "./my_project", "/vagrant/VM1"

* `./my_project`: This is the host directory that will be shared with the VM. Make sure this folder exists on your host system.

* `/vagrant/VM1`: This is the guest directory where the host folder will be mounted. Vagrant automatically mounts synced folders under the /vagrant directory, but we can customize the subfolder name (like VM1).

The benefit here is that any changes you make to the files in the `./my_project` folder on the host will be reflected in the `/vagrant/VM1` folder inside the VM.

To make sure this works:

Create the folder `my_project` on the host: `mkdir ./my_project`.

Run `vagrant up` again to apply the synced folder setting.

### 5. Multi-VM Setup

In more advanced use cases, you might want to manage multiple VMs from a single `Vagrantfile`. This can simulate a multi-server environment, like one with a web server and a database server.

Here’s how you can define multiple VMs in a single Vagrantfile:

        Vagrant.configure("2") do |config|
          # VM 1 (Web Server)
          config.vm.define "test1" do |vm1|
            vm1.vm.box = "ubuntu/bionic64"
            vm1.vm.hostname = "VirtualMachineOne"
            vm1.vm.network "private_network", ip: "192.168.56.10"
            vm1.vm.network "forwarded_port", guest: 80, host: 8080
            vm1.vm.synced_folder "./my_project", "/vagrant/VM1"
          end
        
          # VM 2 (Database Server)
          config.vm.define "test2" do |vm2|
            vm2.vm.box = "ubuntu/bionic64"
            vm2.vm.hostname = "VirtualMachineTwo"
            vm2.vm.network "private_network", ip: "192.168.56.11"
            vm2.vm.network "forwarded_port", guest: 80, host: 8085
            vm2.vm.synced_folder "./my_project", "/vagrant/VM2"
          end
        end

* This creates two VMs, test1 (Web Server) and test2 (Database Server).

* You can run both VMs with vagrant up, or individually with vagrant up test1 or vagrant up test2.

### 6. SSH into VMs

Once your VM is running, you can SSH into it using the following command:

        vagrant ssh vm_name

* This command opens a secure shell (SSH) session inside the guest VM, allowing you to interact with the machine as if you were logged in directly.

The default user for an Ubuntu box is typically vagrant, and the password is usually vagrant as well.

