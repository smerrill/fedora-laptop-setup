#!/bin/bash

if ! type -p ansible-playbook >/dev/null; then
  echo "Please install Ansible to continue."
  exit 0
fi

if [ -z $1 ]; then
  ACCOUNT=$USER
else
  ACCOUNT=$1
fi

echo "Setting up the computer for ${ACCOUNT}. You can change this by passing a parameter to this script."
ansible-playbook -e account=${ACCOUNT} -i hosts -K playbook.yml
