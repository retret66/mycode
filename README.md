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
