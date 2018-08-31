#!/bin/bash

cd ~

# Remove existing vim config.
rm -rf .vim/
rm .vimrc

# Clone the repo (creates ~/.vim/).
git clone https://github.com/taylorvance/.vim.git

# Create a symlink to .vimrc.
ln -s ~/.vim/.vimrc ~/.vimrc

# Install the plugins.
cd ~/.vim/
git submodule init
git submodule update

# fzf requires additional installation.
~/.vim/bundle/fzf/install --all

# Delete this file so we don't accidentally run it again and delete all of our undo history etc.
rm -- "$0"
