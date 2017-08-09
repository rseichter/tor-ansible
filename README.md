## Ansible playbooks for maintaining Tor nodes

Your Ansible inventory must contain a host group 'tornodes', which can be created by adding the following to /etc/ansible/hosts (adapt as necessary):
```
[tornodes]
sample-exit.do.main
sample-relay.do.main:22334
```
Config data for each tor node resides in a _conf/node_name_ subdirectory; see sample directory. All subdirectories will be processed. All found _*.in_ files are combined to a _torrc_ file by using
```
$ make gen
```
Generated _torrc_ files can then be distributed by running the Ansible playbook using
```
$ make play
```
