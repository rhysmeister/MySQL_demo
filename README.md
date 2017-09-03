Simple Vagrant and Ansible project to create a MySQL 5.7 Master -> Slave Setup.

A few users are also created along with some test data;

	db - rhys
	tables - identity, profile
	users - rhys_ro, rhys_rw

Getting started
================

	git clone https://github.com/rhysmeister/MySQL_demo.git
	cd MySQL_demo
	vagrant up;

Once provisioned the hosts can be accessed with;

	vagrant ssh mysql1|mysq2

The root password can be found in MySQL_Demo/vars/main.yml
