#!/bin/bash



function install_vim_pathogen {
  echo "Installing vim pathogen"
  
  # Grab the code per instructions on github.
  mkdir -p ~/.vim/autoload ~/.vim/bundle
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  # Clear and re-set the current user's .vimrc
  touch ~/.vimrc
  > ~/.vimrc
  echo "execute pathogen#infect()" >> ~/.vimrc
  echo "filetype plugin indent on" >> ~/.vimrc
  echo "set tabstop=4" >> ~/.vimrc
  echo "set shiftwidth=4" >> ~/.vimrc
  echo "set expandtab" >> ~/.vimrc
  echo "set number" >> ~/.vimrc

  # Install Solarized color scheme from:
  # http://ethanschoonover.com/solarized/vim-colors-solarized
  cd ~/.vim/bundle
  git clone git://github.com/altercation/vim-colors-solarized.git
  mv vim-colors-solarized ~/.vim/bundle/
  echo "if !has('gui_running')" >> ~/.vimrc
  echo "  let g:solarized_termtrans=1" >> ~/.vimrc
  echo "  let g:solarized_termcolors=16" >> ~/.vimrc
  echo "endif"  >> ~/.vimrc
  echo "syntax enable" >> ~/.vimrc
  echo "set background=dark" >> ~/.vimrc
  echo "colorscheme solarized" >> ~/.vimrc
}

install_vim_pathogen
