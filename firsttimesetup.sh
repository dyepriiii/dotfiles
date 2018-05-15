#!/bin/bash

git clone git@github.com:dyepriiii/dotfiles.git ~/dotfiles
git clone git@github.com:dyepriiii/.vim_runtime.git ~/.vim_runtime
rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~
rm ~/.bash_profile
ln -s ~/dotfiles/.bash_profile ~
rm ~/.inputrc
ln -s ~/dotfiles/.inputrc ~
rm ~/.dircolors.ansi-dark
ln -s ~/dotfiles/.dircolors.ansi-dark ~
rm ~/.dircolors.256dark
ln -s ~/dotfiles/.dircolors.256dark ~
rm ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~
rm ~/.gitignore_global
ln -s ~/dotfiles/.gitignore_global ~
rm -r ~/bin
ln -s ~/dotfiles/notbin ~/bin
rm ~/.vimrc
ln -s ~/.vim_runtime/vimrc ~/.vimrc
rm -r ~/.config/terminology/config
ln -s ~/dotfiles/.config/terminology/config ~/.config/terminology/config
bash ~/.vim_runtime/scripts/get_plugins.sh
mkdir ~/.undodir
