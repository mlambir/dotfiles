# load zgen
source "${HOME}/.zsh/zgen.zsh"


if ! zgen saved; then

  # Load the oh-my-zsh's library.
  zgen oh-my-zsh

  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/git-flow
  zgen oh-my-zsh plugins/virtualenv
  zgen oh-my-zsh plugins/virtualenvwrapper
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/vagrant
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/autojump
  zgen oh-my-zsh plugins/tmux

  # Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions
  
  zgen load zsh-users/zsh-completions

  zgen oh-my-zsh themes/agnoster

  zgen save
fi


export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH=$PATH:~/.config/bspwm/panel
