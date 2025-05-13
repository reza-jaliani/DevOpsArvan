# 🧱 Packer + Vagrant = Custom Automated Dev Environments

These two tools are designed to work together. Here's how they connect:
## 🔧 What Packer Does

Think of Packer as a VM image factory.

It:

Creates fully pre-configured base images (called "boxes" in Vagrant)

Automates the OS installation

Installs initial packages (e.g., Docker, SSH server, dev tools)

Produces .box files or pre-built disk images (.qcow2, .vdi, etc.)

## 📦 What Vagrant Does

Vagrant is a development environment manager.

It:

Uses base boxes created by Packer (or downloaded from Vagrant Cloud)

Creates and destroys VMs as needed

Adds project-specific provisioning (e.g., via shell, Ansible, etc.)

Provides a consistent CLI and workflow

# 🔗 How They Work Together — The DevOps Flow

Here’s the real-world pipeline:
## 1. Use Packer to Create a Base Box

You define a Packer config like ubuntu-20.04.json that:

Installs Ubuntu

Enables SSH

Installs essential software

Outputs a `.box` file like:

        output-ubuntu-20.04/ubuntu-20.04.box

## 2. Use That Box in Vagrant

Then in your `Vagrantfile`:

        config.vm.box_url = "file://./ubuntu-20.04.box"
