#!/bin/bash

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.8.0


# TODO move to .files
echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc


# TODO move to dotfiles
# append completions to fpath
#fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
#autoload -Uz compinit
#compinit