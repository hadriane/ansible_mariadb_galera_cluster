#!/bin/python

import sys, os

# Set variable for IP's file
file_ips = str(sys.argv[1]) + '/files/ips';
 
# Store all hosts IP's in this file
f = open(file_ips, "a")
f.write(str(sys.argv[2]) + "\n")
f.close()