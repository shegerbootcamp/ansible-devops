#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Removing default Ansible version if installed..."
sudo apt remove -y ansible || true
sudo apt --purge autoremove -y

echo "Updating Ubuntu repository and applying all pending patches..."
sudo apt update
sudo apt upgrade -y

echo "Installing software-properties-common package..."
sudo apt -y install software-properties-common

echo "Adding Ansible PPA repository..."
sudo apt-add-repository -y ppa:ansible/ansible

echo "Installing the latest version of Ansible..."
sudo apt update
sudo apt install -y ansible

echo "Ansible installation completed. Verifying the installation..."
ansible --version

echo "Ansible has been successfully installed!"
