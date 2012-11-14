# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="nigelkersten"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

## dirs
vim_swap=${HOME}/.vimswp
[[ ! -d $vim_swap ]] && mkdir -p $vim_swap

## options
setopt nobeep
setopt prompt_subst
setopt nopromptcr
setopt extendedglob
unsetopt nomatch
setopt inc_append_history
setopt extended_history
setopt hist_ignore_space
unsetopt histverify
setopt hist_ignore_dups

## environment
EDITOR="vim"
PAGER="less"
HISTFILE=$HOME/.histfile
HISTSIZE=50000
SAVEHIST=$HISTSIZE

## tmux
if [[ -z $TMUX ]]; then
  tmux attach -d
fi


