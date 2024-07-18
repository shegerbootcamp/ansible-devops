# Ansible Testing Guide

## Inventory Setup

1. **Create Inventory File:**

    Create a file named `hosts` in your current directory with the following content:

    ```ini
    [all]
    server1 ansible_host=192.168.1.10 ansible_user=ubuntu
    server2 ansible_host=192.168.1.11 ansible_user=ubuntu

    [webservers]
    server1

    [dbservers]
    server2
    ```

    Adjust the IP addresses and usernames as per your setup.

2. **Initialize `ansible.cfg` File:**

    Generate a default `ansible.cfg` file with all options disabled:
    
    ```bash
    ansible-config init --disabled -t all > ansible.cfg
    ```

3. **Configure `ansible.cfg` File:**

    Open the `ansible.cfg` file and add the following configuration to set the inventory file path:

    ```ini
    [defaults]
    inventory = ./hosts
    ```

## Common Ansible Ad-Hoc Commands

Here are some common Ansible ad-hoc commands that you can use to perform various tasks on remote hosts:

| Command | Description | Example |
|---------|-------------|---------|
| **Ping Hosts** | Check connectivity to all hosts in the inventory. | `ansible all -m ping` |
| **Run Command** | Run a command on all hosts. | `ansible all -m command -a "uptime"` |
| **Copy File** | Copy a file from the local system to remote hosts. | `ansible all -m copy -a "src=/path/to/local/file dest=/path/to/remote/file"` |
| **Install Package** | Install a package using the package manager. | `ansible all -m apt -a "name=nginx state=present"` |
| **Start Service** | Start a service on remote hosts. | `ansible all -m service -a "name=nginx state=started"` |
| **Gather Facts** | Gather facts about remote hosts. | `ansible all -m setup` |
| **Reboot Hosts** | Reboot all remote hosts. | `ansible all -m reboot` |
| **Fetch File** | Fetch a file from remote hosts to the local system. | `ansible all -m fetch -a "src=/path/to/remote/file dest=/path/to/local/file"` |
| **Manage Users** | Add a new user on remote hosts. | `ansible all -m user -a "name=exampleuser state=present"` |
| **Check Disk Usage** | Check the disk usage on remote hosts. | `ansible all -m shell -a "df -h"` |

## Usage Examples

### Ping Hosts

To check if all hosts in your inventory are reachable, run:
```bash
ansible all -m ping
```

### Run Command

To run the `uptime` command on all hosts:
```bash
ansible all -m command -a "uptime"
```

### Copy File

To copy a file from your local system to all hosts:
```bash
ansible all -m copy -a "src=/path/to/local/file dest=/path/to/remote/file"
```

### Install Package

To install the `nginx` package on all hosts using `apt` (for Debian/Ubuntu systems):
```bash
ansible all -m apt -a "name=nginx state=present"
```

### Start Service

To start the `nginx` service on all hosts:
```bash
ansible all -m service -a "name=nginx state=started"
```

### Gather Facts

To gather facts about all hosts:
```bash
ansible all -m setup
```

### Reboot Hosts

To reboot all hosts:
```bash
ansible all -m reboot
```

### Fetch File

To fetch a file from all hosts to your local system:
```bash
ansible all -m fetch -a "src=/path/to/remote/file dest=/path/to/local/file"
```

### Manage Users

To add a new user named `exampleuser` on all hosts:
```bash
ansible all -m user -a "name=exampleuser state=present"
```

### Check Disk Usage

To check disk usage on all hosts:
```bash
ansible all -m shell -a "df -h"
```

---

This guide should help you get started with testing Ansible installation and using it for ad-hoc commands to manage your remote hosts efficiently.