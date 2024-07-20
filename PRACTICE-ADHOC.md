# Ansible Testing Guide

## Project Setup

### Step 1: Create Project Folder

1. **Create a new project directory named `ansible-adhoc`:**

    ```bash
    mkdir ansible-adhoc
    cd ansible-adhoc
    ```

### Step 2: Create Inventory File

1. **Create an inventory file named `hosts` in the project directory with the following content:**

    ```ini
    [workstation]
    192.168.1.10

    [remoteservers]
    192.168.1.10
    192.168.1.11
    ```

    Adjust the IP addresses as per your setup.

### Step 3: Initialize and Configure `ansible.cfg` File

1. **Generate a default `ansible.cfg` file with all options disabled:**

    ```bash
    ansible-config init --disabled -t all > ansible.cfg
    ```

2. **Open the `ansible.cfg` file and add the following configuration to set the inventory file path:**

    ```ini
    [defaults]
    inventory = ./hosts
    ```

### Step 4: Project Structure

Your project directory structure should look like this:

```
ansible-adhoc/
├── ansible.cfg
├── hosts
```

This guide should help you set up an Ansible project and configure it for use.

---
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

To check if workstation(server1) in your inventory are reachable, run:
```bash
ansible workstation -m ping
```

To check if remote servers(server2 & server3) in your inventory are reachable, run:
```bash
ansible remoteservers -m ping
```

To check if remote servers(server2 & server3) in your inventory disk space, run:
```bash
ansible remoteservers -m shell -a "df -h"
```

### Run Command

To run the `uptime` command on all hosts including server 1(ubuntu):
```bash
ansible all -m command -a "uptime"
```

### Copy File

To copy a file from your local system to all hosts:
```bash
ansible all -m copy -a "src=/path/to/local/file dest=/path/to/remote/file"
```

### Install Package

To install the `nginx` package on remote servers or hosts using `apt` (for Debian/Ubuntu systems):
```bash
ansible remoteservers -m apt -a "name=nginx state=present"
```

### Start Service

To start the `nginx` service on all hosts:
```bash
ansible remoteservers -m service -a "name=nginx state=started"
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
