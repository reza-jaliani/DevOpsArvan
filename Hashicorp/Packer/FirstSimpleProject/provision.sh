#!/bin/bash
sudo apt-get update
sudo apt-get install -y nginx curl
echo "Provisioning done!" > /home/ubuntu/provisioned.txt
