# mycode
Ansible Training


- name: Copying content from controller to hosts
  hosts: planetexpress:!farnsworth
  connection: ansible.builtin.ssh
  gather_facts: true # default is true

  tasks:
  - name: Create the new group for ipv4 access
    ansible.builtin.group:
      name: sysadmin
      state: present
    become: yes

  - name: Create a sysadmin user for ipv4 access
    ansible.builtin.user:
      name: admin1
      comment: "Example Admin"
      state: present
      shell: /bin/bash
      system: no
      createhome: yes
      group: sysadmin
    become: yes

  - name: Copy gather fact var data into hosts
    ansible.builtin.copy:
      content: "{{ ansible_all_ipv4_addresses|ansible_processor_vcpus }}" # facts gathered from host
      dest: /home/admin1/ipv4info.txt      # home directory on hosts
      backup: yes   # make backup of original
      force: yes    # file always copied when content is diff
      owner: admin1 # set the owner (chown) of the file
      group: sysadmin # set the group of the file
      mode: '0644' # set the access permissions of the file
        # mode can also be formatted as follows:
            # mode: u=rw,g=r,o=r
            # mode: u+rw,g-wx,o-wx
    become: yes
