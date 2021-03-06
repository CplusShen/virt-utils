#!/bin/bash -xe
# Date: 2017-0516
# Author: cplus.shen@advantech.com.tw
# Description: setup M30 chip passthrough mode and launch CentOS 7.2 VM

KVM_VM_NAME=VM
set +e 
virsh destroy  $KVM_VM_NAME
virsh undefine $KVM_VM_NAME
set -e
virt-install \
    --ram 2048 \
    --vcpus 2 \
    --disk=$1,device=disk,bus=virtio,format=qcow2 \
    --import \
    --vnc \
    --noautoconsole  \
    --network bridge=br0 \
    --name $KVM_VM_NAME 

