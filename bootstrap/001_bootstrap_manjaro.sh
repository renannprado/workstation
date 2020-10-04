#!/bin/bash

sudo pacman -Syy --noconfirm community/docker 

sudo gpasswd -a $USER docker

sudo systemctl enable docker

sudo systemctl start docker

pip3 install ansible