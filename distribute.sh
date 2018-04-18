#!/bin/bash
for d in `cat ./hosts.conf`; do
  echo "copying to $d ...";
  scp /root/.ssh./authorized_keys root@$d:/root/.ssh./authorized_keys
done;
