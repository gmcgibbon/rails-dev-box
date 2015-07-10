#!/bin/sh

# size of swapfile in megabytes
swapsize=1024

# does the swap file already exist?
grep -q 'swapfile' /etc/fstab

# if not then create it
if [ $? -ne 0 ]; then
  fallocate -l ${swapsize}M /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
fi

# output results to terminal
df -h
cat /proc/swaps
cat /proc/meminfo | grep Swap
