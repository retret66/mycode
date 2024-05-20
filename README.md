- name: Copying content from controller to hosts
  hosts: planetexpress:!farnsworth
  connection: ansible.builtin.ssh
  gather_facts: true

  tasks:
    - name: Copy gather fact var data into hosts
      ansible.builtin.copy:
        content: |
          IPv4 Addresses: {{ ansible_all_ipv4_addresses | join(', ') }}
          Number of CPU Cores: {{ ansible_processor_vcpus }}
        dest: /path/to/hostinfo.txt
        backup: yes
        force: yes
        owner: admin1
        group: sysadmin
        mode: '0644'
      become: yes



student@bchd:~/mycode$ ansible fry -m setup |grep 10.10
            "10.10.2.4"
            "address": "10.10.2.4",
            "broadcast": "10.10.2.255",
            "gateway": "10.10.2.1",
            "network": "10.10.2.0",
            "SSH_CLIENT": "10.10.2.1 35728 22",
            "SSH_CONNECTION": "10.10.2.1 35728 10.10.2.4 22",
                "address": "10.10.2.4",
                "broadcast": "10.10.2.255",
                "network": "10.10.2.0",
                "10.10.2.4",
