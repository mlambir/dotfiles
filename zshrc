source $HOME/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle dotenv
antigen bundle fzf
antigen bundle autojump
antigen bundle aws

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply


alias rr='fd -HI -g .git -t d --base-directory=$HOME| grep -v "^\." |  rev | cut -c 6- | rev | sort 2>/dev/null > $HOME/.repos'
alias r='cd $(cat $HOME/.repos | fzf)'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/mariano.lambir/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH=/Users/mariano.lambir/.meteor:$PATH
