#!/bin/sh

# size of swapfile in megabytes
SWAP_SIZE=1024

# does the swap file already exist?
grep -q 'swapfile' /etc/fstab

# if not then create it
if [ $? -ne 0 ]; then
  fallocate -l ${SWAP_SIZE}M /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap defaults 0 0' >> /etc/fstab
fi
