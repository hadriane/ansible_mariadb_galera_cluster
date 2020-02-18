#!/bin/bash

# Loop through IP's files. For each IP get it's hostname
IFS=$'\n'
set -f
for i in $(cat < "$1"/files/ips); do
  host1="$(ssh ansible@$i "hostname")"
  echo "$host1" >> "$1"/files/hostnames
done