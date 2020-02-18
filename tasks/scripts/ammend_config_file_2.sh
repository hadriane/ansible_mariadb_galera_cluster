#!/bin/bash

# Declare and assign variables
declare host_name

# Configure wsrep_node_name in server.cnf file
host_name=$(ssh 'ansible'@"$2" 'hostname')
sed '/wsrep_node_name=''/ s/$/'$host_name''\''/' $1/templates/tmp/$2 > $1/templates/tmp/$2.tmp
mv $1/templates/tmp/$2.tmp $1/templates/tmp/$2

# Remove tmp files
#rm -f $1/templates/tmp/$2.tmp

# Remove tmp files
rm -f $1/templates/tmp/server.cnf.tmp
