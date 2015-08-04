# load zgen
source ".zsh/zgen.zsh"


if ! zgen saved; then

  # Load the oh-my-zsh's library.
  zgen oh-my-zsh


  # Bundles from the default repo (robbyrussell's oh-my-zsh).
  zgen oh-my-zsh plugins/git
  zgen oh-my-zsh plugins/virtualenv
  zgen oh-my-zsh plugins/virtualenvwrapper
  zgen oh-my-zsh plugins/python
  zgen oh-my-zsh plugins/pip
  zgen oh-my-zsh plugins/nvm
  zgen oh-my-zsh plugins/npm
  zgen oh-my-zsh plugins/autojump

  # Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions
  
  zgen load zsh-users/zsh-completions
  zgen load caiogondim/bullet-train-oh-my-zsh-theme bullet-train

  zgen save
fi

export TERM=xterm-256color

