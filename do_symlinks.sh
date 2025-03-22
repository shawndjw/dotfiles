#!/bin/bash

DOTFILES_DIR=~/.dotfiles

# Create symlinks for dotfiles dirs
mkdir -vp ~/.config
for dir in $(find $DOTFILES_DIR -maxdepth 1 -mindepth 1 -type d); do
  dir_name=$(basename "$dir")
  if [ "$dir_name" != ".git" ]; then
    if [ -d ~/.config/$dir_name ] && [ ! -L ~/.config/$dir_name ]; then
      mv ~/.config/$dir_name ~/.config/${dir_name}.bak
    fi
    ln -vsf -t ~/.config ${DOTFILES_DIR}/$dir_name
  fi
done

# Create symlinks for dotfiles files
for file in $(find $DOTFILES_DIR -maxdepth 1 -mindepth 1 -type f -name ".*"); do
  file_name=$(basename "$file")
  if [ -f ~/.config/$file_name ] && [ ! -L ~/.config/$file_name ]; then
      mv ~/$file_name ~/${file_name}.bak
  fi
  ln -vsf ${DOTFILES_DIR}/$file_name ~/$file_name
done
