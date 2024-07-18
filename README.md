### README for GitHub Repository

# Ansible Installation on Ubuntu

This guide provides steps to install Ansible on Ubuntu 18.04, 20.04, and 22.04 LTS. Ansible is a powerful automation tool used for configuration management, application deployment, and task automation.

## Prerequisites

- Ubuntu 18.04, 20.04, or 22.04 LTS
- A user with sudo privileges

## Steps to Install Ansible

### 1. Remove the Default Ansible Version

First, remove any default version of Ansible supplied by the official Ubuntu repositories:

```bash
sudo apt remove ansible
sudo apt --purge autoremove
```

### 2. Update Ubuntu Repositories

Update the Ubuntu repositories and apply all pending patches:

```bash
sudo apt update
sudo apt upgrade
```

### 3. Install `software-properties-common`

Install the `software-properties-common` package to enable PPA (Personal Package Archive) support:

```bash
sudo apt -y install software-properties-common
```

### 4. Add the Ansible PPA

Add the Ansible PPA to your system:

```bash
sudo apt-add-repository ppa:ansible/ansible
```

### 5. Install the Latest Version of Ansible

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
└── .gitignore
```

Add the above README content to the `README.md` file in your GitHub repository. This will help users follow the steps to install Ansible on their Ubuntu systems.
