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

  # Syntax highlighting bundle.
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions
  
  zgen load zsh-users/zsh-completions

  zgen oh-my-zsh themes/agnoster

  zgen save
fi


export TERM=xterm-256color

export JAVA_HOME='/usr/lib/jvm/java-7-openjdk-amd64/jre'
export EC2_HOME='/usr/local/ec2/ec2-api-tools-1.7.5.1'
export PATH=$PATH:$EC2_HOME/bin

export AWS_ACCESS_KEY='AKIAJVG2OLL5L3TPFTWA'
export AWS_SECRET_KEY='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'
