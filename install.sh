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
stow tmux

#zsh
sudo apt install -y zsh
chsh -s /bin/zsh

#misc packages
sudo apt install -y curl openjdk-8-jdk 

# bspwm
BSPWM_INSTALL_DIR=~/soft/bspwm
sudo apt-get install xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev gcc make rxvt-unicode-256color dmenu
git clone https://github.com/baskerville/bspwm.git $BSPWM_INSTALL_DIR/bspwm
git clone https://github.com/baskerville/sxhkd.git $BSPWM_INSTALL_DIR/sxhkd
git clone https://github.com/baskerville/xdo.git $BSPWM_INSTALL_DIR/xdo
git clone https://github.com/baskerville/sutils.git $BSPWM_INSTALL_DIR/sutils
git clone https://github.com/baskerville/xtitle.git $BSPWM_INSTALL_DIR/xtitle
git clone https://github.com/LemonBoy/bar.git $BSPWM_INSTALL_DIR/bar
sudo cp $BSPWM_INSTALL_DIR/bspwm/contrib/freedesktop/bspwm.desktop /usr/share/xsessions/


#nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install node
nvm alias default node
nvm use node

