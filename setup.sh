#!/bin/sh
# install VimPlug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# setup clangd
wget https://github.com/clangd/clangd/releases/download/10.0.0/clangd-linux-10.0.0.zip
unzip clangd-linux-10.0.0.zip
echo 'export PATH=/home/$USER/.config/nvim/clangd_10.0.0/bin:$PATH' >> ~/.bashrc
