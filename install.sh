#!/usr/bin/bash
# bashrc
ln -s $(pwd)/bash/.bashrc  $HOME/.bashrc
# powerlevel
ln -s $(pwd)/powerlevel/.p10k.zsh $HOME/.p10k.zsh
# rofi
mkdir -p $HOME/.config/rofi
ln -s $(pwd)/rofi/.config/rofi/config.rasi $HOME/.config/rofi/config.rasi
# picom
mkdir -p $HOME/.config/picom/
ln -s $(pwd)/picom/.config/picom/picom.conf $HOME/.config/picom/picom.conf
# zshrc
ln -s $(pwd)/zsh/.zshrc $HOME/.zshrc
# nvim
ln -s $HOME/.dotfiles/nvim/.config/nvim $HOME/.config/nvim
# qtile
ln -s $HOME/.dotfiles/qtile/.config/qtile $HOME/.config/qtile
# alacritty
ln -s $HOME/.dotfiles/alacritty/.config/alacritty $HOME/.config/alacritty
# pip
ln -s $HOME/.dotfiles/pip/.config/pip/pip.conf $HOME/.config/pip/pip.conf
# pylint
ln -s $HOME/.dotfiles/pylint/.pylintrc $HOME/.pylintrc
# fastfetch
mkdir -p $HOME/.config/fastfetch
ln -s $HOME/.dotfiles/fastfetch/.config/fastfetch/config.jsonc $HOME/.config/fastfetch/config.jsonc
# gtk
ln -s $HOME/.dotfiles/gtk/.config/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
