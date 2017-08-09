## Ansible playbook for maintaining Tor nodes

This playbook is designed to generate `torrc` configuration files from a set of separate text files and then conveniently distribute the config data to a set of Tor nodes. Config data for each node resides in a `conf/node_name` subdirectory, with node_name matching the Ansible host name. See samples. All subdirectories will be processed automatically. All found `*.in` files can be combined to a torrc file by using
```
$ make gen
```
Generated torrc files can then be distributed by running the Ansible playbook using
```
$ make play
```

Your Ansible inventory must contain a host group _tornodes_ which can be created by adding the following to /etc/ansible/hosts (adapt as necessary):
```
[tornodes]
sample-exit.do.main
sample-relay.do.main:22334
```

This has been tested with GNU Make 3.81 and Ansible 2.3.1.0, with both Debian Linux 8.9 (jessie) and Gentoo Linux target servers.
