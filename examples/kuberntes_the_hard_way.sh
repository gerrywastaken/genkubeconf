#!/bin/bash

script_name=$0
script_full_path=$(dirname "$0")
echo $script_full_path

if [ "$script_full_path" != "." ]; then
  echo "This script must be run fron within the \`examples\` directory"
  exit
fi

PATH=$PATH:../bin
LOCAL_IP='127.0.0.1'
LOADBALANCER_IP='192.168.5.30'

genkubeconf kube-controller-manager $LOCAL_IP system:kube-controller-manager
genkubeconf kube-controller-manager $LOCAL_IP system:kube-controller-manager
genkubeconf kube-scheduler $LOCAL_IP system:kube-scheduler
genkubeconf admin $LOCAL_IP admin

# For workers
genkubeconf kube-proxy $LOADBALANCER_IP system:kube-proxy
