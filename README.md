# Ansible - Installing and Configuring Galera Cluster
 
## Setup

* Platform			: AWS
* Operating System	: CentOS Linux release 7.7.1908 (Core)
* AMI ID			: ami-02eac2c0129f6376b
* Python Version	: 2.7

## Running playbook

Run the playbook using the following command

```
sudo ansible-playbook -i ./hosts/hosts install_mariadb_cluster.yml
```
