#!/bin/bash

asdf install nodejs

npm install -g @bitwarden/cli

asdf reshim nodejs

bw config server https://bitwarden.hom
