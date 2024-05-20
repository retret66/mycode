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


fry@fry:~$ sudo cat /home/admin1/ipv4info.txt
{"IPv4 Info": "address: 10.10.2.4\nalias: eth0\nbroadcast: 10.10.2.255\ngateway: 10.10.2.1\ninterface: eth0\nmacaddress: 02:42:0a:0a:02:04\nmtu: 1450\nnetmask: 255.255.255.0\nnetwork: 10.10.2.0\nprefix: '24'\ntype: ether\n"}fry@fry:~$ 
fry@fry:~$ 
