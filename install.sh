#!/bin/bash 
#Vundle Install via le git.
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
###########################
#creation des directory backup_files swap_files
mkdir -p ~/.vim/backup_files
mkdir -p ~/.vim/swap_files
##########################
#copie de vimrc et bundle/
cp -r bundle/ ~/.vim/
cp vimrc ~/.vim/


echo "Lancer VIM et faire :PluginInstall"
