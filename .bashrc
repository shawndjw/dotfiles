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

function md() {
  pandoc --to pdf $1 > /tmp/$1.pdf
  xdg-open /tmp/$1.pdf
}

alias pkm='nvim ~/Documents/PKM/'
alias pacman='sudo pacman'
alias adsearch='. ~/.ldap_env; LDAPTLS_REQCERT=never ldapsearch -y ~/.ldap -x -o ldif-wrap=no -H $LDAP_HOST -s sub -D "$LDAP_USER" -b "$LDAP_BASE" -W'
alias sw='ssh -Y d12vm.lan'
alias k='kubectl'

function ns() {
  if [ ! -z "$1" ]; then
    kubectl config set-context --current --namespace=${1}
  fi
  NS=$(kubectl config view --minify | grep namespace: | awk '{print $NF}')
  echo "Current namespace: $NS"
}

function aksdev01() {
  az account set --subscription fcc63316-3030-43c9-b243-7c0a2a2c66f1
  az aks get-credentials --resource-group rg-dev-aks-01-cc --name aks-dev-01-cc --overwrite-existing
  kubelogin convert-kubeconfig -l azurecli
}

function aksqa01() {
  az account set --subscription 61e635c2-c3cd-4e2e-a9e8-2ea0d4a7377d
  az aks get-credentials --resource-group rg-qa-aks-01-cc --name aks-qa-01-cc --overwrite-existing
  kubelogin convert-kubeconfig -l azurecli
}

function aksprd01() {
  az account set --subscription d504d08e-be2c-4147-81ae-f98a69bd2c51
  az aks get-credentials --resource-group rg-prd-aks-01-cc --name aks-prd-01-cc --overwrite-existing
  kubelogin convert-kubeconfig -l azurecli
}

function dlogs() {
  az monitor log-analytics query --workspace 942defc2-e8bf-411e-b090-811894adc90e --analytics-query "$@"
}

function plogs() {
  az monitor log-analytics query --workspace 0a451818-101f-4600-a7a1-65431a326483 --analytics-query "$@"
}
