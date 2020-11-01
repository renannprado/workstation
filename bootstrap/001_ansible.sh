#!/bin/bash

# sudo pacman -Syy --noconfirm git

# sudo gpasswd -a $USER docker

# sudo systemctl enable docker

# sudo systemctl start docker

pip3 install ansible

# necessary to use the pacman tasks
ansible-galaxy collection install community.general

git clone https://github.com/renannprado/workstation.git -b master ~/workstation