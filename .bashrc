#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=nvim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

set -o vi

alias pkm='nvim ~/Documents/PKM/'
alias pacman='sudo pacman'
alias adsearch='. ~/.ldap_env; LDAPTLS_REQCERT=never ldapsearch -y ~/.ldap -x -o ldif-wrap=no -H $LDAP_HOST -s sub -D "$LDAP_USER" -b "$LDAP_BASE" -W'
alias k='kubectl'
