#!/bin/bash

#host1=$(ssh ansible@172.30.1.248 "hostname")

#echo "$host1"


#while read p; do
#  host1=$(ssh ansible@"$p" "hostname")
#  echo "$p"
#  echo "$host1"
#done < /etc/ansible/mariadb/files/ips


#while IFS= read -r line
#do
#  echo "$line"
#  host1="$(ssh ansible@$line "hostname")"
#  eval $host1
#  echo "$host1"
#done < /etc/ansible/mariadb/files/ips
#
#
#IFS=$'\n'       # make newlines the only separator
#set -f          # disable globbing
#for i in $(cat < "$1"); do
#  echo "tester: $i"
#done


IFS=$'\n'       # make newlines the only separator
set -f          # disable globbing
for i in $(cat < "$1"/files/ips); do
  host1="$(ssh ansible@$i "hostname")"
  echo "$host1" >> "$1"/files/hostnames
done