### README for GitHub Repository

# Ansible Installation on Ubuntu

This guide provides steps to install Ansible on Ubuntu 18.04, 20.04, and 22.04 LTS. Ansible is a powerful automation tool used for configuration management, application deployment, and task automation.

## Prerequisites

- Ubuntu 18.04, 20.04, or 22.04 LTS
- A user with sudo privileges

## Steps to Install Ansible

### 1. Automated Installation Using a Bash Script

You can automate the Ansible installation process by using the provided Bash script.

#### Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/shegerbootcamp/ansible-devops.git

    cd ansible-devops
    ```

2. Make the script executable:

    ```bash
    chmod +x install_ansible.sh
    ```

3. Run the script:

    ```bash
    ./install_ansible.sh
    ```

### 2. Manual Installation Steps

If you prefer to install Ansible manually, follow these steps:

#### Remove the Default Ansible Version

First, remove any default version of Ansible supplied by the official Ubuntu repositories:

```bash
sudo apt remove ansible
sudo apt --purge autoremove
```

#### Update Ubuntu Repositories

Update the Ubuntu repositories and apply all pending patches:

```bash
sudo apt update
sudo apt upgrade
```

#### Install `software-properties-common`

Install the `software-properties-common` package to enable PPA (Personal Package Archive) support:

```bash
sudo apt -y install software-properties-common
```

#### Add the Ansible PPA

Add the Ansible PPA to your system:

```bash
sudo apt-add-repository ppa:ansible/ansible
```

#### Install the Latest Version of Ansible

Finally, install the latest version of Ansible using `apt`:

```bash
sudo apt install ansible
```

## Verifying the Installation

To verify that Ansible has been installed correctly, run:

```bash
ansible --version
```

You should see output displaying the version of Ansible installed on your system.

## Contributing

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This guide should help you set up Ansible on your Ubuntu system smoothly. For more details on using Ansible, refer to the [official documentation](https://docs.ansible.com/ansible/latest/index.html).

---

### Example of GitHub Repository Structure

```
ansible-installation-guide/
├── README.md
├── LICENSE
├── install_ansible.sh
└── .gitignore
```

---

### `install_ansible.sh`

```bash
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
```

