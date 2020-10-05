#!/bin/bash

sudo pacman -Syy --noconfirm git community/docker 

sudo gpasswd -a $USER docker

sudo systemctl enable docker

sudo systemctl start docker

pip3 install ansible

# necessary to use the pacman tasks
ansible-galaxy collection install community.general