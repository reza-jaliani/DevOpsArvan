# A simple project with Packer to install an Ubuntu automatically.

## First try on Packer

## Installation Packer

        sudo apt update
        sudo apt install wget
        wget https://releases.hashicorp.com/packer/1.8.6/packer_1.8.6_linux_amd64.zip
        unzip packer_1.8.6_linux_amd64.zip
        sudo mv packer /usr/local/bin/
        packer --version

## Creating a Basic Image with Packer

        mkdir packer-project
        cd packer-project

### Create a Packer configuration file

**ubuntu.json**:

This file will contain the configuration for building your machine image.

### Validate the configuration

        packer validate ubuntu.json

### Build the image

        packer build ubuntu.json


## Add Provisioning to Packer

Provisioning is how we install packages, copy files, run setup scripts, etc., during the build.

1- Create **provision.sh**

2- Add provision block to ubuntu.json

3- Rebuild the VM:

        packer validate ubuntu.json
        packer build ubuntu.json

## Automate the Ubuntu installation

Use Autoinstall with a user-data cloud-init file

        mkdir http
        nano http/user-data

You'll find **http/user-data** file in repo.

And then: Add the **"http_directory": "http"** block to your **ubuntu.json** file.

Rebuild the package:

        packer build ubuntu.json

