#!/bin/python

import sys, os, json, subprocess

#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print '1st Argument :', str(sys.argv[1])

#filePath1 = str(sys.argv[1]) + '/files/ips';
#filePath2 = str(sys.argv[2]) + '/files/hostnames';
#filePath = os.path.join(str(sys.argv[1]), 'ips')

filePath1 = '/etc/ansible/mariadb/files/ips';
filePath2 = '/etc/ansible/mariadb/files/hostnames';
 
# As file at filePath is deleted now, so we should check if file exists or not not before deleting them





with open(filePath1, 'a') as inf:
	for line in inf:
		res = subprocess.check_output(['ssh ansible@'str(line)' hostname'])
		print (res)
	
	