## Ansible playbook for maintaining [Tor](https://www.torproject.org/) nodes

This [Ansible](https://www.ansible.com) playbook and supporting shell scripts are designed to generate `torrc` configuration files from a set of separate text files and then conveniently distribute the config data to a set of Tor nodes. Config data for each node resides in a `conf*/ansible_hostname` subdirectory. Any directory name that begins with 'conf' is scanned for subdirectories. Sample config files for both a Tor relay and a Tor exit are included in `conf.sample`. All found `*.in` files need to be combined to node-specific torrc files in the `generated` directory by using
```
$ make gen
```
In a second step, generated torrc files can then be distributed by running the Ansible playbook using
```
$ make play
```
Ansible will signal all Tor nodes which received new torrc data to reload their configuration, activating the changes without any need to manually login to a node.

Your Ansible inventory must contain a host group _tornodes_ which can be created by adding the following to /etc/ansible/hosts (adapt as necessary):
```
[tornodes]
sample-exit.do.main
sample-relay.do.main:22334
```

This has been tested with GNU Make 3.81 and Ansible 2.3.1.0, with both Debian Linux 8 (jessie) and Gentoo Linux target servers, running Tor 0.3.0.10.
