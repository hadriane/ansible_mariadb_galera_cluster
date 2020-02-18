#!/bin/bash

# Declare and assign variables
declare -a array_ips
declare ip_addr
declare host_name
db_combined=$2:$3

# Load individual lines of IP's file into array.
let i=0
while IFS=$'\n' read -r line_data; do
    array_ips[i]="${line_data}"
    ((++i))
done < $1/files/ips

# Get all hosts IP addresses into a single line and save to ip_addr variable
x=0
array_len=`expr ${#array_ips[@]} - 1`
for i in "${array_ips[@]}"
do 

	if [ $x -lt $array_len ]
	then
		ip_addr="$ip_addr$i,"
	else
		ip_addr="$ip_addr$i\""
	fi
	((++x))
done

# Configure wsrep_cluster_address in server.cnf file
sed '/gcomm:\/\// s/$/'$ip_addr'/' $1/templates/server.cnf.default > $1/templates/tmp/server.cnf.tmp


for i in "${array_ips[@]}"
do
	# Configure wsrep_node_address in server.cnf file
	sed '/wsrep_node_address=''/ s/$/'$i''\''/' $1/templates/tmp/server.cnf.tmp > $1/templates/tmp/server.cnf.$i.tmp
	mv $1/templates/tmp/server.cnf.$i.tmp $1/templates/tmp/$i.tmp
	# Configure wsrep_node_name in server.cnf file
	host_name=$(ssh 'ansible'@'172.30.1.248' 'hostname')
	sed '/wsrep_node_name=''/ s/$/'$host_name''\''/' $1/templates/tmp/$i.tmp > $1/templates/tmp/$i
	cp $1/templates/tmp/$i $1/templates/tmp/$i.tmp
	# Configure wsrep_sst_auth in server.cnf file
	sed '/wsrep_sst_auth=/ s/$/'$2:$3'/' $1/templates/tmp/$i.tmp > $1/templates/tmp/$i
	# Remove tmp files
	rm -f $1/templates/tmp/$i.tmp
done

# Remove tmp files
rm -f $1/templates/tmp/server.cnf.tmp
