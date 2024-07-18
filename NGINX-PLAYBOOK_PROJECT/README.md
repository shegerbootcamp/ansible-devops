### Step 1: Create Project Structure
First, create the project folder and necessary subdirectories:
```bash
mkdir -p NGINX-PLAYBOOK_PROJECT/{inventory,playbooks}
cd NGINX-PLAYBOOK_PROJECT
```

### Step 2: Create an Inventory File
Create a file named `hosts` in the `inventory` directory with the following content:
```bash
echo "[fedora_servers]
123.12.23.4 ansible_user=fedora ansible_ssh_private_key_file=~/.ssh/your_private_key.pem" > inventory/hosts
```

### Step 3: Create `ansible.cfg`
Generate an initial configuration file using:
```bash
ansible-config init --disabled -t all > ansible.cfg
```

Modify `ansible.cfg` to specify the inventory file:
```ini
[defaults]
inventory = inventory/hosts
```

### Step 4: Create the Playbook
Create a file named `install_nginx.yml` in the `playbooks` directory with the following content:
```yaml
---
- name: Install NGINX on Fedora Server
  hosts: fedora_servers
  become: yes
  tasks:
    - name: Ensure NGINX is installed
      dnf:
        name: nginx
        state: present

    - name: Ensure NGINX is started and enabled
      systemd:
        name: nginx
        state: started
        enabled: yes
```

### Final Project Structure
Your project directory should look like this:
```
NGINX-PLAYBOOK_PROJECT/
├── ansible.cfg
├── inventory
│   └── hosts
└── playbooks
    └── install_nginx.yml
```

### Running the Playbook
To run the playbook and install NGINX on the Fedora server, use the following command:
```bash
ansible-playbook playbooks/install_nginx.yml
```

This guide should help you set up the `NGINX-PLAYBOOK PROJECT` and install NGINX on a Fedora server.