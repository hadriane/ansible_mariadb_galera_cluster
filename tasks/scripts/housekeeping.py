import sys, os

# Delete IP's file in files directory
if os.path.exists(str(sys.argv[1]) + '/files/ips'):
	os.remove(str(sys.argv[1]) + '/files/ips')

# Delete hostnames file in files directory
if os.path.exists(str(sys.argv[1]) + '/files/hostnames'):
	os.remove(str(sys.argv[1]) + '/files/hostnames')

# Delete all files in ./templates/tmp directory	
for root, dirs, files in os.walk(str(sys.argv[1]) + '/templates/tmp'):
    for file in files:
        os.remove(os.path.join(root, file))

# Create hostnames file in ./files directory
if not os.path.exists(str(sys.argv[1]) + '/files/hostnames'):
    os.mknod(str(sys.argv[1]) + '/files/hostnames')
	
# Erase all contents of hostnames file
open(str(sys.argv[1]) + '/files/hostnames', 'w').close()