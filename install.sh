#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

mkdir ~/soft
mkdir ~/dev

#python stuff
sudo apt install -y python-pip python-dev python-pip python3-dev python3-pip
sudo pip install virtualenv virtualenvwrapper

#neovim
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y neovim python-dev python-pip python3-dev python3-pip
sudo pip2 install neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60

#powerline fonts
git clone https://github.com/powerline/fonts.git ~/soft/powerline
pushd ~/soft/powerline
./install.sh
popd

#settings
sudo apt install -y stow
stow nvim
stow zsh

#zsh
sudo apt install -y zsh
chsh -s /bin/zsh

#misc packages
sudo apt install -y curl openjdk-8-jdk 

#nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install node
nvm alias default node
nvm use node

