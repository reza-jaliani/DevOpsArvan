# Step1Learning.md

Introduction
---------------------
In this document, I will detail my learning steps for Vagrant and Packer as I explore virtual machine provisioning and automation, using VirtualBox as the provider on Ubuntu 24.

***1. Setting Up the Environment***


Before getting started with Vagrant and VirtualBox, it’s important to ensure that the environment is set up correctly:

1. Ubuntu 24: The host operating system was chosen to set up the development environment.
2. VirtualBox: This is the virtualization software where we will run our VMs. Vagrant uses VirtualBox to create, manage, and control the virtual machines.
3. Vagrant: A tool for managing virtual machine environments, allowing for easy creation, configuration, and provisioning of machines.
4. This setup allows you to work in isolated environments for testing, development, and learning, while using the same machine.

***2. Installing Vagrant***


We began by installing Vagrant on the host machine (Ubuntu 24) to help manage virtual environments.

        sudo apt update
        sudo apt install vagrant
        vagrant --version

***3. Creating and Configuring Virtual Machines***


Once Vagrant is installed, the next step is to create and configure virtual machines using a Vagrantfile. The Vagrantfile is a configuration file that defines the settings for one or more VMs.

**1. Defining the VM in the Vagrantfile:**

        Vagrant.configure("2") do |config|
          config.vm.define "test1" do |vm1|
            vm1.vm.box = "ubuntu/bionic64"  # Base operating system
            vm1.vm.hostname = "VirtualMachineOne"  # VM hostname
            vm1.vm.network "private_network", ip: "192.168.56.10"  # Private IP for VM
            vm1.vm.network "forwarded_port", guest: 80, host: 8080  # Port forwarding
          end
        end
